# ~/.bashrc
```
alias e='emacs -nw'
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8
```

# Change CAPS LOCK to Ctrl
```
sudo emacs -nw /etc/default/keyboard
XKBOPTIONS="ctrl:nocaps"
```

# Consol Language
```
export LANG=en_US
```

# NVIDIA Driver
```
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
ubuntu-drivers devices
sudo apt install nvidia-driver-460
```

# Audio noise coutermeasure
```
sudo emacs -nw /etc/modprobe.d/alsa-base.conf

options snd-hda-intel power_save=0 power_save_controller=N
```

# Visual Stdio Code
```
sudo apt install curl
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
ls -l
ls -l /etc/apt/trusted.gpg.d/
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
ls -l /etc/apt/trusted.gpg.d/
ls /etc/apt/sources.list.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
ls /etc/apt/sources.list.d/
cat /etc/apt/sources.list.d/vscode.list
sudo apt install apt-transport-https
sudo apt update
apt list code
sudo apt list -a code
sudo apt install code
code --version
```

# emacs

.install
```
sudo apt update
sudo apt install emacs
```
.recent-ext
```
M-x package-install<RET>
recentf-ext
```

.irony
```
M-x list-packages
irony
helm
company
company-irony
```

.elisp
```
redo+.el
doxymacs.el
xml-parse.el
xml.el
```

#tmux
.tpm
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

.tmux.conf
```
unbind C-b
set-option -g prefix C-c
bind-key C-c send-prefix
bind-key -n M-Up resize-pane -U 5
bind-key -n M-Down resize-pane -D 5
bind-key -n M-Left resize-pane -L 5
bind-key -n M-Right resize-pane -R 5

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
### set -g @plugin 'tmux-plugins/tmux-sensible'

run-shell '~/.tmux/plugins/tpm/tpm'
### run-shell ~/tmux-resurrect/resurrect.tmux
```

.plugin install
```
tmux source ~/.tmux.conf
prefix + I
```

# Development Environment
```
sudo apt update
sudo apt install build-essential
sudo apt install clang-format
sudo apt install autotools-dev
sudo apt install autoconf
sudo apt install cmake
```


# Chrom Plugins
```
AutoScroll
Google Translator
Chromium Wheel Smooth Scroller
Google Keep
```
