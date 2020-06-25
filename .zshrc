source ~/sfw/root-6.18.02/obj/bin/thisroot.sh
export PATH=/usr/local/opt/qt/bin:$PATH
export LDFLAGS="-L/usr/local/opt/qt/lib":$LDFLAGS
export CPPFLAGS="-I/usr/local/opt/qt/include":$CPPFLAGS
export PKG_CONFIG_PATH=/usr/local/opt/qt/lib/pkgconfig:$PKG_CONFIG_PATH

#export C_INCLUDE_PATH="~/sfw/geant4.10.06.p02-install/include/Geant4"
#export C_INCLUDE_PATH="/usr/local/include/CLHEP"

#cd ~/sfw/geant4.10.06.p02-install/bin/
source ~/sfw/geant4.10.06.p02-install/bin/geant4_zsh.sh
#source geant4.sh
#cd ~
#
export G4INST_DIR=~/sfw/geant4.10.06.p02-install
export PATH=$G4INST_DIR/bin:$PATH
export LD_LIBRARY_PATH=$G4INST_DIR/lib:$LD_LIBRARY_PATH
export G4ENSDFSTATEDATA=$G4INST_DIR/share/Geant4-10.6.2/data/G4ENSDFSTATE2.2
export G4INCLUDE=~/sfw/geant4.10.06.p02-install/include



alias gcmake='cmake -DGeant4_DIR=~/sfw/geant4.10.06.p02-install/lib/Geant4-10.6.2/'
alias python='/usr/bin/python3'
export CLHEP_BASE_DIR=/usr/local/include/CLHEP
export G4VRMLFILE_VIEWER=/Applications/freewrl.app/Contents/MacOS/FreeWRL

export LANG=ja_JP.UTF-8
export LC_ALL='ja_JP.UTF-8'
export SHELL=/bin/zsh
autoload colors
colors

### prompt ######################
PROMPT="%{${fg[green]}%}[%n@%m]%(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{$reset_color}%}"
RPROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}"
export LS_COLORS

# git設定
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

### autojump ########################
autoload -U compinit && compinit
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt share_history
setopt auto_cd
setopt auto_pushd
#setopt correct
setopt list_packed
setopt nolistbeep
alias ls='ls -G'
alias la='ls -a'
alias ll='ls -l'
alias cp='cp -i'
alias -g L='| less'
alias -g G='| grep'


##  zsh setting  #######################
export TERM=xterm-256color
HGENCODING=utf-8
export HGENCODING
setopt auto_pushd
setopt pushd_ignore_dups
setopt complete_aliases
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
zstyle ':completion:*:(processes|jobs)' menu yes select=2
bindkey "\e[Z" reverse-menu-complete
function chpwd() { ls }
export LSCOLORS=gxfxcxdxbxegedabagacad

alias root='root -l'
export PYTHONSTARTUP=~/.pythonstartup
