# Javaの言語設定を英語にする。
export _JAVA_OPTIONS="-Duser.language=us -Duser.country=JP"

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
export PATH=$HOME/.pyenv/shims:$PATH
eval "$(pyenv init -)"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# rbenv
export RBENV_ROOT=$HOME/.rbenv
export PATH=$RBENV_ROOT/bin:$PATH
export PATH=$RBENV_ROOT/shims:$PATH
eval "$(rbenv init -)"

# RUST
export RUST_ROOT=$HOME/.cargo
export PATH=$RUST_ROOT/bin:$PATH

# pipenv
export PIPENV_VEIN_IN_PROJECT=true

# mysql
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# 環境変数
export LANG=ja_JP.UTF-8

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
# 直前のコマンドの重複を削除
setopt hist_ignore_dups
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# 同時に起動したzshの間でヒストリを共有
setopt share_history

# 補完機能を有効にする
autoload -U compinit; compinit -C
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補を詰めて表示
setopt list_packed
# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''

# コマンドのスペルを訂正
setopt correct
# ビープ音を鳴らさない
setopt no_beep

# prompt
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd() { vcs_info }
PROMPT='%F{yellow}%*%f %~
	$ '
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
# alias
alias restart='exec $SHELL -l'
alias finish="python /Users/yamadaikuya/gitrepos/research_log/research_log_beta.py"
alias ls='ls -F'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias cat='cat -n'
alias less='less -NM'
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

##############################
# zplug
##############################
export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug "themes/blinks", from:oh-my-zsh
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'mollifier/anyframe'

if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

#2018.0608追記
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
### 補完候補がなければより曖昧に候補を探す。
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' keep-prefix
zstyle ':completion:*' recent-dirs-insert both
#alias julia='/path/to/install/folder/bin/julia'
#alias julia='/path/to/install/folder/bin/julia'
#alias julia='yamadaikuya/bin/julia'
#alias julia='/Users/yamadaikuya/bin/julia'
alias julia='/Users/yamadaikuya/.julia'
