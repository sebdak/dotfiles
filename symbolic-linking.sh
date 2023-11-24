if [[ -f ~/.zshrc ]]; then
  echo "⚠️  zshrc exists. Skipping symbolig link"
else
  echo "✅ Creating symbolic link for zshrc"
	ln -s $(pwd)/.zshrc ~/.zshrc
fi

if [[ -f ~/.tmux.conf ]]; then
  echo "⚠️  tmux config exists. Skipping symbolig link"
else
  echo "✅ Creating symbolic link for tmux config"
	ln -s $(pwd)/.tmux.conf ~/.tmux.conf
fi

[ ! -d ~/.config ] && echo "Creating .config directory" && mkdir ~/.config

if [[ -d ~/.config/nvim ]]; then
  echo "⚠️  Neovim directory exists. Skipping symbolig link"
else
  echo "✅ Creating symbolic link for neovim directory"
	ln -s $(pwd)/nvim ~/.config/nvim
fi
