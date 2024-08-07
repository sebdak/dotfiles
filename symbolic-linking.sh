if [[ -f ~/.zshrc ]]; then
  echo "⚠️  zshrc exists. Skipping symbolig link"
else
  echo "✅ Creating symbolic link for zshrc"
	ln -s $(pwd)/.zshrc ~/.zshrc
fi

if [[ -d ~/.zsh ]]; then
  echo "⚠️  zsh exists. Skipping symbolig link"
else
  echo "✅ Creating symbolic link for zsh"
	ln -s $(pwd)/.zsh ~/.zsh
fi

if [[ -f ~/.alacritty.toml ]]; then
  echo "⚠️  Alacritty exists. Skipping symbolig link"
else
  echo "✅ Creating symbolic link for Alacritty"
	ln -s $(pwd)/.alacritty.toml ~/.alacritty.toml
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

if [[ -d ~/.config/kitty ]]; then
  echo "⚠️  Kitty directory exists. Skipping symbolig link"
else
  echo "✅ Creating symbolic link for kitty directory"
	ln -s $(pwd)/kitty ~/.config/kitty
fi
