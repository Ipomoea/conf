# Should be located in ~/.zshrc

# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Homebrew (macOS only)
if [[ "$OSTYPE" == darwin* ]]; then
    if [ "$(arch)" = "arm64" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export GEM_HOME=$HOME/.gem

export PROJ=$HOME/Projects
export TESTPROJ=$HOME/TestProjects
export PUBPROJ=$HOME/PublicProjects

# PATH
export PATH=/usr/local/bin:$GEM_HOME/bin:~/.local/bin:$PATH
if [[ "$OSTYPE" == darwin* ]]; then
    export PATH=~/.rugby/clt:~/.lmstudio/bin:$PATH
    export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig:$PKG_CONFIG_PATH"
fi

set horizontal-scroll-mode on

ZSH_THEME="powerlevel10k/powerlevel10k"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

plugins=(
	bundler
	git
	zsh-syntax-highlighting
	z
)

source $ZSH/oh-my-zsh.sh

# Aliases

if command -v nvim >/dev/null 2>&1; then
  alias zshconfig="nvim ~/.zshrc"
  alias tmuxconfig="nvim ~/.tmux.conf"
  alias ohmyzsh="nvim ~/.oh-my-zsh"
  alias nvimconfig="nvim ~/.config/nvim/"
else
  alias zshconfig="vim ~/.zshrc"
  alias ohmyzsh="vim ~/.oh-my-zsh"
  alias tmuxconfig="vim ~/.tmux.conf"
fi

alias vimconfig="vim ~/.vimrc"
alias cls="clear"
alias cdpp="cd $PUBPROJ"
alias cdtp="cd $TESTPROJ"

# macOS-only aliases (rely on pbcopy/pbpaste/uuidgen or iOS projects)
if [[ "$OSTYPE" == darwin* ]]; then
    alias cdas="cd $PROJ/aviasales-ios"
    alias cpycurbranch="git branch --show-current | pbcopy | echo 'Branch name copied'"
    alias uuid="uuidgen | tr 'A-Z' 'a-z' | tr -d '\n' | pbcopy && pbpaste && echo"
fi

# rbenv
if command -v rbenv >/dev/null 2>&1; then
    eval "$(rbenv init - --no-rehash zsh)"
fi

# Integrate fzf to zsh
if command -v fzf >/dev/null 2>&1; then
    eval "$(fzf --zsh)"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

echo "Loaded ~/.zshrc"
