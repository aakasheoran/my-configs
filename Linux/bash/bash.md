# Some command I use in bash shell

## Ignore Dups in history file

This will make bash ignore both duplicate commands and commands that start with a space, and it will also remove older duplicates from the history.

```bash
export HISTCONTROL=ignoreboth:erasedups
```

## Remove existing dups

Use this command to remove existing duplicates commands from the history file.

```bash
awk '!a[$0]++' ~/.bash_history > temp && mv temp ~/.bash_history
```
