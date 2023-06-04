# My linux setup process

## Install Fish

```bash
sudo apt-get install fish
```

### Change default Shell

Either use `chsh` or add the following command at the end of `.bashrc` file:

```bash
echo 'exec fish' >> ~/.bashrc
```

### Create Symlink

Create a symbolic link between original fish history and where you want the history file to be

```bash
ln -s ~/.local/share/fish/fish_history ~/.config/fish/fish_history
```

---

## Install Packages

### Exa

It's a replacement for `ls` command.

```bash
sudo apt-get install exa
```

#### Set alias

```bash
alias ls 'exa -lah'
```

---

### Bat

It's a replacement for `cat` command.

```bash
wget https://github.com/sharkdp/bat/releases/download/v0.23.0/bat-musl_0.23.0_amd64.deb
sudo dpkg -i bat-musl_0.23.0_amd64.deb
rm bat-musl_0.23.0_amd64.deb
```

#### Set alias

```bash
alias cat 'bat'
```

---
