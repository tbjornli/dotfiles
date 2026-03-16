## Installation

### Packages

**CachyOS / Arch**
```
pacman -S bat fzf ripgrep the_silver_searcher
```

**Ubuntu / Debian**
```
apt install bat fzf ripgrep silversearcher-ag
```

### dotfiles

```
mkdir ~/.tmp
git clone git@github.com:tbjornli/dotfiles.git dotfiles
cd dotfiles
git submodule init
git submodule update
sh link-dotfiles
```

The script auto-detects the desktop environment via `$XDG_CURRENT_DESKTOP`. To override:

```
sh link-dotfiles --de=kde   # KDE Plasma
sh link-dotfiles --de=xfce  # Xfce
sh link-dotfiles --de=all   # link everything
```

### vim

To install necessary plugins, open vim and run

```
:PlugInstall
```

---

### Xfce-specific

#### move-to-next-monitor

```
apt install wmctrl xdotool
wget https://raw.githubusercontent.com/jc00ke/move-to-next-monitor/master/move-to-next-monitor -O ~/.local/bin/move-to-next-monitor
chmod +x ~/.local/bin/move-to-next-monitor
```

* Configure keyboard binding

  Binding: **Ctrl-Shift-Alt-N**
  Command: **move-to-next-monitor**

#### Background
```
cp nightking.png /usr/share/xfce4/backdrops/
```
