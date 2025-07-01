# Funsies
abbr -a please sudo

# Navigation utilities - create abbr for ... to ../..
for i in (seq 3 10)
    set dots (string repeat -n $i .)
    set dirs (string repeat -n (math $i - 1) "../")
    abbr -a $dots $dirs
end

# Git stuff
abbr -a ga git add
abbr -a gst git status -bs
abbr -a gc git commit -m \'\'
abbr -a gp git push
abbr -a gsu git push --set-upstream origin
abbr -a gl git log --oneline --graph --decorate --all

