function packersync
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
end
