#
# Aliases
#
alias mv='nocorrect mv -v'
alias cp='nocorrect cp -v'
alias rm='nocorrect rm -v'
alias mkdir='nocorrect mkdir -p'
alias md='mkdir'
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
alias lsf='ls -latr `find -type f`'
alias du='du -h'
alias df='df -h'
alias clr='find . -regex .*~ | xargs rm -f'
alias clean='rm *~'
alias sc='less /usr/share/X11/rgb.txt'
alias mnt='sudo mount'
alias mntl='sudo mount -o loop'
alias umnt='sudo umount'
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
alias grep='grep --color=auto --binary-files=without-match'

alias myip='curl check-host.net/ip' #alt: curl ifconfig.me
alias whois="whois -h whois-servers.net"

alias memrss='while read command percent rss; do if [[ "${command}" != "COMMAND" ]]; then rss="$(bc <<< "scale=2;${rss}/1024")"; fi; printf "%-26s%-8s%s\n" "${command}" "${percent}" "${rss}"; done < <(ps -A --sort -rss -o comm,pmem,rss | head -n 11)'

alias pwg='pwgen -cnB 8 10 | while read PASS; do echo -n "$PASS\t"; echo -n "$PASS" | md5sum | cut -f1 -d" "; done'

# Git
alias gst='git status -sb'
alias gil='git log --graph --pretty=format:"%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset" --abbrev-commit --date=relative --color'
alias ga='git add'
alias gc='git commit -m'
alias gp='git pull && git push'
alias gull='git pull'
alias gush='git push'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'

alias mc='mc -S xoria256'

if which pastebinit &>/dev/null; then
  alias out='pastebinit -b http://paste.ubuntu.com -a ademaro'
fi

 
if which pydf &>/dev/null; then
  alias df='pydf'
fi

#if which ack-grep &>/dev/null; then
#  alias grep='ack-grep'
#fi

# Check domains in pix.NS
alias dns1='dig @ns1.pixelon.ru +short'
alias dns2='dig @ns2.pixelon.ru +short'

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
