function ll --wraps exa --description 'alias ll=exa -la --header'
    exa -la --header $argv
end