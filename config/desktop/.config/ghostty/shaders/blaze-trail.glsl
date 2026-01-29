// Stolen from https://github.com/KroneCorylus/ghostty-shader-playground/blob/main/public/shaders/cursor_frozen.glsl and modified

float getSdfRectangle(in vec2 p, in vec2 xy, in vec2 b)
{
    const vec2 d = abs(p - xy) - b;
    return length(max(d, 0.)) + min(max(d.x, d.y), 0.);
}

// Based on Inigo Quilez's 2D distance functions article: https://iquilezles.org/articles/distfunctions2d/
// Potencially optimized by eliminating conditionals and loops to enhance performance and reduce branching

float seg(in vec2 p, in vec2 a, in vec2 b, inout float s, float d) {
    const vec2 e = b - a;
    const vec2 w = p - a;
    const vec2 proj = a + e * clamp(dot(w, e) / dot(e, e), 0., 1.);
    const float segd = dot(p - proj, p - proj);
    d = min(d, segd);

    const float c0 = step(0., p.y - a.y);
    const float c1 = 1. - step(0., p.y - b.y);
    const float c2 = 1. - step(0., e.x * w.y - e.y * w.x);
    const float allCond = c0 * c1 * c2; float noneCond = (1. - c0) * (1. - c1) * (1. - c2);
    const float flip = mix(1., -1., step(0.5, allCond + noneCond));
    s *= flip;

    return d;
}

float getSdfParallelogram(in vec2 p, in vec2 v0, in vec2 v1, in vec2 v2, in vec2 v3) {
    float s = 1.;
    float d = dot(p - v0, p - v0);

    d = seg(p, v0, v3, s, d);
    d = seg(p, v1, v0, s, d);
    d = seg(p, v2, v1, s, d);
    d = seg(p, v3, v2, s, d);

    return s * sqrt(d);
}

vec2 norm(vec2 value, float isPosition) {
    return (value * 2.0 - (iResolution.xy * isPosition)) / iResolution.y;
}

float determineStartVertexFactor(vec2 c, vec2 p) {
    // Conditions using step
    const float condition1 = step(p.x, c.x) * step(c.y, p.y); // c.x < p.x && c.y > p.y
    const float condition2 = step(c.x, p.x) * step(p.y, c.y); // c.x > p.x && c.y < p.y

    // If neither condition is met, return 1 (else case)
    return 1.0 - max(condition1, condition2);
}

vec2 getRectangleCenter(vec4 rectangle) {
    return vec2(rectangle.x + (rectangle.z / 2.), rectangle.y - (rectangle.w / 2.));
}

float ease(float t) {
    return pow(1.0 - t, 3.0);
}

const float DURATION = 0.3; //IN SECONDS

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    fragColor = texture(iChannel0, fragCoord.xy / iResolution.xy);
    // Normalization for fragCoord to a space of -1 to 1;
    const vec2 vu = norm(fragCoord, 1.);
    const vec2 offsetFactor = vec2(-.5, 0.5);

    // Normalization for cursor position and size;
    // cursor xy has the postion in a space of -1 to 1;
    // zw has the width and height
    const vec4 currentCursor = vec4(norm(iCurrentCursor.xy, 1.), norm(iCurrentCursor.zw, 0.));
    const vec4 previousCursor = vec4(norm(iPreviousCursor.xy, 1.), norm(iPreviousCursor.zw, 0.));

    const vec2 centerCC = getRectangleCenter(currentCursor);
    const vec2 centerCP = getRectangleCenter(previousCursor);
    // When drawing a parellelogram between cursors for the trail i need to determine where to start at the top-left or top-right vertex of the cursor
    const float vertexFactor = determineStartVertexFactor(currentCursor.xy, previousCursor.xy);
    const float invertedVertexFactor = 1.0 - vertexFactor;

    // Set every vertex of my parellogram
    const vec2 v0 = vec2(currentCursor.x + currentCursor.z * vertexFactor, currentCursor.y - currentCursor.w);
    const vec2 v1 = vec2(currentCursor.x + currentCursor.z * invertedVertexFactor, currentCursor.y);
    const vec2 v2 = vec2(previousCursor.x + currentCursor.z * invertedVertexFactor, previousCursor.y);
    const vec2 v3 = vec2(previousCursor.x + currentCursor.z * vertexFactor, previousCursor.y - previousCursor.w);

    const float sdfCurrentCursor = getSdfRectangle(vu, currentCursor.xy - (currentCursor.zw * offsetFactor), currentCursor.zw * 0.5);
    const float sdfTrail = getSdfParallelogram(vu, v0, v1, v2, v3);

    const float progress = clamp((iTime - iTimeCursorChange) / DURATION, 0.0, 1.0);
    const float easedProgress = ease(progress);
    const float lineLength = distance(centerCC, centerCP);

    // Branchless doTrail, multiplied in fragColor assignment mix
    const vec4 cursorDifference = previousCursor - currentCursor;
    const float horizontalDistance = abs(cursorDifference.x);
    const float verticalDistance = abs(cursorDifference.y);
    const float cellHeight = currentCursor.w;
    const float cellWidth = cellHeight * 0.6;
    const float distanceMarginFactor = 1.25;
    const float doTrailH = max(sign(horizontalDistance - cellWidth * distanceMarginFactor), 0.);
    const float doTrailV = max(sign(verticalDistance - cellHeight * distanceMarginFactor), 0.);
    const float doTrail  = max(doTrailH, doTrailV);

    const vec4 trail_color = iCurrentCursorColor;
    const vec4 trail_color_accent = trail_color * 0.125;

    const float trailPadding = .007;

    //trailblaze
    vec4 trail = mix(trail_color_accent, fragColor, 1. - smoothstep(0., sdfTrail + trailPadding, 0.007));
    trail = mix(trail_color, trail, 1. - smoothstep(0., sdfTrail + trailPadding, 0.006));
    trail = mix(trail, trail_color, step(sdfTrail + trailPadding, 0.));

    //cursorblaze
    trail = mix(trail_color_accent, trail, 1. - smoothstep(0., sdfCurrentCursor + .002, 0.004));
    trail = mix(trail_color, trail, 1. - smoothstep(0., sdfCurrentCursor + .002, 0.004));

    fragColor.rgb = mix(trail.rgb, fragColor.rgb, 1. - smoothstep(0., sdfCurrentCursor, easedProgress * lineLength * doTrail));
}

