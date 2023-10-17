# Switch git branches using fzf
function sb
    git checkout (git branch | fzf | tr -d '[:space:]')
end
