function parui --description 'paru with fzf search and preview'
    alias pars='paru --color always -Sl | sed -e "s: :/:; s/ unknown-version//; /installed/d" | fzf --multi --ansi --preview "paru -Si {1}" | xargs -ro paru -S' $argv
end
