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

# tmux
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
sudo apt install texinfo
sudo apt install libtool
sudo ast install libust-1.0-0-dev
```

# Chrom Plugins
```
AutoScroll
Google Translator
Chromium Wheel Smooth Scroller
Google Keep
```

# git
```
[user]
    name = kobankid
    email = kobankid@xxx.xxx
[core]
	editor = vim
[credential]
	helper = cache
```

# openocd
```
sudo ./src/openocd -f ./tcl/board/sifive-hifive1-revb.cfg
```

# USB device settings
```
sudo emacs -nw /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash usbcore.autosuspend=-1"
sudo update-grub
```

# Kernel Update
```
sudo apt update
sudo add-apt-repository ppa:cappelikan/ppa
sudo apt install mainline
```

# risc-v toolchain
```
sudo apt-get install autoconf automake autotools-dev curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev
git clone https://github.com/riscv/riscv-gnu-toolchain.git
git checkout -b xxxxx origin/xxxxxx
git submodule update --init --recursive
if needed, in submodule directories you must do the command of "git checkout".
```

# ruby
```
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
eval "$(rbenv init -)" // This description is added to .bashrc
cat .bashrc
source ~/.bashrc
rbenv -v
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
sudo apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev -y
rbenv install -l
rbenv install 2.7.3
rbenv global 2.7.3
ruby -v
gem update --system
gem install bundler // if needed
```

# asciidoctor
```
gem install asciidoctor
gem install --pre asciidoctor-pdf
gem install asciidoctor-pdf-cjk
gem install asciidoctor-diagram
```

# Visual Stdio Code
## Asciidoctor Settings
```
Asciidoctor_command : asciidoctor -r asciidoctor-diagram
Use_asciidoctor_js : clear the checkbox
```

# Ruby gem install version confirmation
```
# 安定バージョン全部
gem list rails -rea
# 開発版を含む全部
gem list rails -rea --pre
# 最新安git clone git://github.com/yyuu/pyenv.git ~/.pyenv定版
gem list rails -re
```

# Python
```
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils
sudo apt install liblzma-dev
```
```
git clone git://github.com/yyuu/pyenv.git ~/.pyenv
```
```
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
```

.bash_profile
```
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi
```
```
source ~/.bash_profile
```
```
pyenv install 3.5.0
```
```
pyenv local 2.7.0
pyenv global 3.5.0
```

```
sudo apt install tk-dev
sudo apt install python3-tk
pip install pandas
pip install openpyxl
pip install matplotlib
pip install xlrd
pip install openpyxl
```

# tcpdump
When OpenOCD and GDB Debugging
```
tcpdump -i lo -X dst port 3333 or src port 3333
```

# Eclipse
## .class decompiler settings
```
 Help -> Eclipse Market Place -> Enhanced Class Decompiler -> install
 Import -> Plug-in Development -> Plugins and Fragments
 Select ".class" file -> right click -> Open Class With
 Window -> Preference -> General -> Editors -> File Associations
```
