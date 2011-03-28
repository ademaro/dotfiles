#################################################
# My super awesome confg file for ZedShell.     #
#################################################

umask 022
#
# Clean paths
#
#export PATH=""
#export MANPATH=""
ZSH_MYCONFDIR=~/.zsh
#
# Locale
#
export LANG="ru_RU.UTF-8"
export LC_ALL="ru_RU.UTF-8"
export LC_CTYPE="ru_RU.UTF-8"

export COLORFGBG="default;default"
export TERM=xterm-256color
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'

#
# Gcc flags
#
export CFLAGS="-I/opt/local/include ${CFLAGS}"
export CPPFLAGS="-I/opt/local/include ${CPPFLAGS}"

#
# Load options
#
source $ZSH_MYCONFDIR/options.zsh
# Use hard limits, except for a smaller stack and no core dumps
unlimit
limit stack 8192
limit core 0
limit -s
#
# Set history stuff
#
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
DIRSTACKSIZE=20

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

#
# Functions
#
source $ZSH_MYCONFDIR/functions.zsh

#
# Mostly all Linux distributions used /etc/profile.d dir 
# for collecting path info
#
load_files "/etc/prodile.d" "sh"


#
# Make PATH from /etc/path(.d)?
#
PATH=`read_path_dir /etc/paths "$PATH"`
MANPATH=`read_path_dir /etc/manpaths "$MANPATH"`

export MANPATH

#
# Scan path dir for new path
#
PATH_SCAN_DIR=$ZSH_MYCONFDIR/path
export PATH=`read_path_dir $PATH_SCAN_DIR "$PATH" .path`

load_files "$PATH_SCAN_DIR.d" ".zsh"

#export MANPATH=/opt/local/share/man:$MANPATH
export EDITOR=vim
export PAGER=less

export UNAME_S=$(uname -s 2>&1 || echo "Linux" )

#
# Load aliases
#
source $ZSH_MYCONFDIR/aliases.zsh

#
# Load completion
#
fpath=($ZSH_MYCONFDIR/function.d $fpath)
source $ZSH_MYCONFDIR/completion.zsh
#
# Load binds
#
source $ZSH_MYCONFDIR/keybind.zsh

export PKG_MANAGER=none
for i in {port,fink,brew,apt-get};do
    `which $i > /dev/null` && export PKG_MANAGER=$i
done

#
# Load prompt
#
if [[ -f $ZSH_MYCONFDIR/prompt.zsh ]]; then
    source $ZSH_MYCONFDIR/prompt.zsh
else
    prompts=($ZSH_MYCONFDIR/prompt.d/*)
    source $prompts[1]
fi

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# vim: set noet ts=4 tw=80 :


if command -v ubuntu-server-tip &>/dev/null; then
  ubuntu-server-tip
fi
