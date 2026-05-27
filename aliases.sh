#!/bin/bash

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias home='cd ~'
alias rootdir='cd /'

# File listing
alias ll='ls -alh --color=auto'
alias la='ls -A'
alias l='ls -CF'

# System information
alias cpu='lscpu'
alias mem='free -h'
alias disk='df -h'
alias mounts='mount | column -t'
alias uptime='uptime -p'
alias topcpu='ps aux --sort=-%cpu | head -20'
alias topmem='ps aux --sort=-%mem | head -20'

# Network
alias ports='ss -tulpn'
alias listening='netstat -tulpn'
alias myip='curl -4 ifconfig.me && echo'
alias ipinfo='ip -br a'
alias pingg='ping google.com'
alias route='ip route'

# Processes
alias psg='ps aux | grep -i'
alias kill9='kill -9'
alias pstree='pstree -p'

# Logs
alias logs='journalctl -xe'
alias bootlog='journalctl -b'
alias nginxlog='tail -f /var/log/nginx/access.log'
alias nginxerr='tail -f /var/log/nginx/error.log'
alias apachelog='tail -f /var/log/apache2/access.log'
alias apacheerr='tail -f /var/log/apache2/error.log'

# Services
alias services='systemctl list-units --type=service'
alias failed='systemctl --failed'
alias restartnginx='systemctl restart nginx'
alias restartapache='systemctl restart apache2'
alias restartmysql='systemctl restart mysql'
alias restartdocker='systemctl restart docker'

# Updates
alias update='apt update'
alias upgrade='apt update && apt upgrade -y'
alias autoremove='apt autoremove -y'
alias cleanup='apt autoremove -y && apt autoclean'

# Docker
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dlog='docker logs -f'
alias dexec='docker exec -it'
alias dstopall='docker stop $(docker ps -q)'
alias drmall='docker rm $(docker ps -aq)'

# Docker Compose
alias dc='docker compose'
alias dcup='docker compose up -d'
alias dcdown='docker compose down'
alias dclogs='docker compose logs -f'
alias dcrestart='docker compose restart'

# Security
alias ufwstatus='ufw status verbose'
alias sshconfig='nano /etc/ssh/sshd_config'
alias sshrestart='systemctl restart ssh'

# Quick editing
alias hosts='nano /etc/hosts'
alias bashrc='nano ~/.bashrc'
alias aliases='nano /etc/profile.d/aliases.sh'

# Web servers
alias nginxconf='nano /etc/nginx/nginx.conf'
alias nginxsites='cd /etc/nginx/sites-enabled'
alias apacheconf='cd /etc/apache2/sites-enabled'

# Useful shortcuts
alias cls='clear'
alias h='history'
alias j='jobs -l'

alias whereami='echo "Host: $(hostname -f) | IP: $(hostname -I)"'

alias rm='rm -Iv --preserve-root'
alias cp='cp -iv'
alias mv='mv -iv'

alias myip='curl -4 ifconfig.me && echo'

# Search processes
pg() {
    ps aux | grep -i "$1" | grep -v grep
}

# Show largest directories
bigdirs() {
    du -h --max-depth=1 "$1" 2>/dev/null | sort -hr | head -20
}

# Follow a service log
jlog() {
    journalctl -fu "$1"
}

# Check VPS health
health() {
    echo "=== UPTIME ==="
    uptime

    echo -e "\n=== MEMORY ==="
    free -h

    echo -e "\n=== DISK ==="
    df -h

    echo -e "\n=== LOAD ==="
    w

    echo -e "\n=== PORTS ==="
    ss -tulpn | head -20
}
