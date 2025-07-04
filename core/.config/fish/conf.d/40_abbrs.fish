# Funsies
abbr -a please 'sudo'

# Goto dotfiles
abbr -a dot 'cd ~/.dotfiles'

# Navigation utilities - create abbr for ... to ../.., .... to ../../../, and so on
for i in (seq 3 10)
    set dots (string repeat -n $i .)
    set dirs (string repeat -n (math $i - 1) "../")
    abbr -a $dots $dirs
end

# Git stuff
abbr -a gI 'git init'
abbr -a gR 'git remote -v'
abbr -a gRa 'git remote add'
abbr -a gRr 'git remote remove'
abbr -a gst 'git status -bs'
abbr -a gd 'git diff'
abbr -a gds 'git diff --staged'
abbr -a gsts 'git stash'
abbr -a gstp 'git stash pop'
abbr -a gstd 'git stash drop'
abbr -a gstl 'git stash list'
abbr -a gsta 'git stash apply'
abbr -a gstc 'git stash clear'
abbr -a gb 'git branch -av'
abbr -a gsw 'git switch'
abbr -a gswc 'git switch -c'
abbr -a ga 'git add'
abbr -a gaa 'git add .'
abbr -a gau 'git add -u'
abbr -a gaA 'git add -A'
abbr -a gai 'git add -p'
abbr -a grmc 'git rm --cached'
abbr -a gc 'git commit -m \'\''
abbr -a gca 'git commit -a -m \'\''
abbr -a goops 'git commit --amend'
abbr -a gOops 'git commit --amend --no-edit'
abbr -a gOOPS 'git rebase -i HEAD~16'
abbr -a gcp 'git cherry-pick'
abbr -a gundo 'git reset --soft HEAD^'
abbr -a gUndo 'git reset --hard HEAD^'
abbr -a gt 'git tag -a -m \'\''
abbr -a gtd 'git tag -d'
abbr -a gtpa 'git push origin --tags'
abbr -a gtl 'git tag -l'
abbr -a gl 'git log --oneline --graph --decorate --all'
abbr -a gll 'git log -1 --stat'
abbr -a gpl 'git pull'
abbr -a gm 'git merge --no-edit'
abbr -a gp 'git push'
abbr -a gpu 'git push --set-upstream origin'
abbr -a gpf 'git push --force-with-lease'
abbr -a gpF 'git push --force --force'
abbr -a gcl 'git clean -f'
abbr -a gcla 'git clean -fd'
abbr -a gclA 'git clean -xfd'
abbr -a gcln 'git clean -n'
abbr -a gnuke 'git fetch && git reset --hard origin/main'

