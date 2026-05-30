# conf  

A collection of configuration files for development tools.  

## Contents  
- **C/C++**: [.clang-format](https://raw.githubusercontent.com/Ipomoea/conf/main/.clang-format)
- **Swift**: [.swiftlint.yml](https://raw.githubusercontent.com/Ipomoea/conf/main/.swiftlint.yml)
- **Vim**: [.vimrc](https://raw.githubusercontent.com/Ipomoea/conf/main/.vimrc)
- **Zsh**: [.zshrc](https://raw.githubusercontent.com/Ipomoea/conf/main/.zshrc), [.p10k.zsh](https://raw.githubusercontent.com/Ipomoea/conf/main/.p10k.zsh)
- **Tmux**: [.tmux.conf](https://raw.githubusercontent.com/Ipomoea/conf/main/.tmux.conf)
- **Kitty**: [kitty.conf](https://raw.githubusercontent.com/Ipomoea/conf/main/kitty.conf)
- **Server bootstrap**: [bootstrap_server.sh](https://raw.githubusercontent.com/Ipomoea/conf/main/bootstrap_server.sh)

## Server setup

Bootstrap a fresh Debian/Ubuntu box (installs zsh, vim, fzf, oh-my-zsh, and pulls the configs from this repo):

```sh
curl -fsSL https://raw.githubusercontent.com/Ipomoea/conf/main/bootstrap_server.sh | sh
```

## License  
This project is licensed under [The Unlicense](LICENSE).  
