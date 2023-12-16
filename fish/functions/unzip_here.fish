function unzip_here --description 'extracts to a dir of same name'
    unzip $argv -d (basename $argv .zip)
end
