# Funsies
abbr -a please sudo

# Navigation utilities - create abbr for ... to ../..
for i in (seq 3 10)
    set dots (string repeat -n $i .)
    set dirs (string repeat -n (math $i - 1) "../")
    abbr -a $dots $dirs
end

