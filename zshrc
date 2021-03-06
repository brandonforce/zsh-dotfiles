export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

isOSX="[[ $OSTYPE == *darwin* ]]"
isLinux="[[ $OSTYPE == *linux* ]]"

zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"
zplug "plugins/git", from:oh-my-zsh, if:"which git", nice:10
zplug "plugins/rsync", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh, if:"which tmux", nice:10
zplug "plugins/sublime", from:oh-my-zsh
zplug "plugins/yarn", from:oh-my-zsh, nice:10
zplug "plugins/common-aliases", from:oh-my-zsh, nice:10
zplug "plugins/brew", from:oh-my-zsh, if:$isOSX
zplug "plugins/osx", from:oh-my-zsh, if:$isOSX, nice:10
zplug "plugins/debian", from:oh-my-zsh, if:$isLinux
zplug "knu/z", use:z.sh, nice:10
zplug "rimraf/k", use:k.sh

zplug "~/.zsh", from:local
zplug "~/", use:".extra", from:local, if:"[[ -f ~/.extra ]]"

zplug "zsh-users/zsh-completions", nice:17
zplug "zsh-users/zsh-syntax-highlighting", nice:18
zplug "zsh-users/zsh-history-substring-search", nice:19

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'

DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
APPEND_HISTORY="true"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

export PATH="$HOME/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Make vim the default editor
export EDITOR="vim"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Prefer US English and use UTF-8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Link Homebrew casks in `/Applications` rather than `~/Applications`
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
