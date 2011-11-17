#
# Aliases
#
alias mv='nocorrect mv -v'
alias cp='nocorrect cp -v'
alias rm='nocorrect rm -v'
alias mkdir='nocorrect mkdir'
alias man='nocorrect man'
alias find='noglob find'
case `uname` in
  FreeBSD)
    alias ls='ls -FG'
    ;;
  Linux)
    alias ls='ls -F --color=auto'
    ;;
esac
alias ll='ls -la'
alias la='ls -a'
alias li='ls -ial'
alias lsd='ls -ld *(-/DN)'
alias lsa='ls -ld .*'
alias du='du -h'
alias df='df -h'
alias x='startx'
alias ps='ps'
alias cal='cal'
alias clr='find . -regex .*~ | xargs rm -f'
alias mkinst='sudo make install'
alias sc='less /usr/share/X11/rgb.txt'
alias mnt='sudo mount'
alias mntl='sudo mount -o loop'
alias umnt='sudo umount'
alias cfg='./configure --prefix=/usr --sysconfdir=/etc'
alias u2d='perl -pi -e "s/\\n/\\r\\n/;"'
alias d2u='perl -pi -e "s/\\r\\n/\\n/;"'
alias slog='sudo tail -f /var/log/messages | ccze -A -p syslog'
alias mlog='sudo tail -f /var/log/maillog | ccze -A -p syslog'
alias pst='pstree -G | less'
alias h=history
alias ispell='ispell -d russian'
alias -g M='|more'
alias -g L='|less'
alias -g H='|head'
alias -g T='|tail'
alias -g N='2>/dev/null'
alias v='vim'
alias gv='gvim'
alias d='dirs -v'
alias ssync='rsync --rsh=ssh'
alias ssyncr='rsync --rsh=ssh --recursive --verbose --progress'
alias grab='sudo chown ${USER} --recursive'
alias hmakej='hilite make -j'
alias clean='rm *~'
alias emacs='emacs -nw'
alias grep='grep --color=auto --binary-files=without-match'

# Git
alias gst='git status'
alias gil='git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative'
alias ga='git add'
alias gc='git commit -m'
alias gp='git pull && git push'
alias gull='git pull'
alias gush='git push'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'

if which pastebinit &>/dev/null; then
  alias out='pastebinit -b http://paste.ubuntu.com -a ademaro'
fi

#
# Read additional aliases
#
if [ -d $ZSH_MYCONFDIR/aliases.d/ ]; then
    load_files $ZSH_MYCONFDIR/aliases.d
    case "$PKG_MANAGER" in
    port)
        load_files $ZSH_MYCONFDIR/aliases.d/macports
        ;;
    fink)
        load_files $ZSH_MYCONFDIR/aliases.d/fink
        ;;
    brew)
        load_files $ZSH_MYCONFDIR/aliases.d/brew
        ;;
    apt-get)
        load_files $ZSH_MYCONFDIR/aliases.d/apt-get
        ;;
    esac
fi
