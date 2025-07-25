#!/usr/bin/env bash

set -e

THRESHOLD_LOW=20
THRESHOLD_CRITICAL=10
INTERVAL=1
STATE_FILE='/tmp/battery_notify_state'
DEVICE='/sys/class/power_supply/BAT0/'
CAPACITY_FILE="${DEVICE}capacity"
STATUS_FILE="${DEVICE}status"

rm -f $STATE_FILE

while true; do
    sleep "$INTERVAL"

    percent=$(cat $CAPACITY_FILE)
    status=$(cat $STATUS_FILE)
    last_state=$(cat "$STATE_FILE" 2>/dev/null || echo "ok")

    if [ "$status" = "Discharging" ]; then
        if [ "$percent" -lt "$THRESHOLD_CRITICAL" ]; then
            if [ "$last_state" != 'critical' ]; then
                hyprctl notify 3 10000 0 "  BATTERY CRITICAL                "
                echo 'critical' > "$STATE_FILE"
            fi
            continue
        fi

        if [ "$percent" -lt "$THRESHOLD_LOW" ]; then
            if [ "$last_state" != 'low' ] && [ "$last_state" != "critical" ]; then
                hyprctl notify 0 5000 0 "  BATTERY LOW                "
                echo 'low' > "$STATE_FILE"
            fi
            continue
        fi
    fi

    if [ "$last_state" != 'ok' ]; then
        echo 'ok' > "$STATE_FILE"
    fi
done

