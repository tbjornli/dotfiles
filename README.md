## Installation

Install necessary packages

```
apt install bat fzf ripgrep silversearcher-ag
```

### dotfiles

Download and install dotfiles

```
git clone git@github.com:tbjornli/dotfiles.git dotfiles
cd dotfiles
git submodule init
git submodule update
sh link-dotfiles
```

### vim

To install necessary plugins, open vim and run

```
:PlugInstall
```

### move-to-next-monitor

```
apt install wmctrl xdotool
wget https://raw.githubusercontent.com/jc00ke/move-to-next-monitor/master/move-to-next-monitor -o ~/.local/bin/move-to-next-monitor
chmod +x ~/.local/bin/move-to-next-monitor
```

* Configure keyboard binding

  Binding: **Ctrl-Shift-Alt-N**
  Command: **move-to-next-monitor**
