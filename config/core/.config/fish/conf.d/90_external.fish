if status is-interactive
    # zoxide
    if type -q zoxide
        zoxide init fish --cmd cd | source
    end
end
