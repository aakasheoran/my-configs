### For Powershell >= v7.3

# Auto suggestions
Set-PSReadLineOption -PredictionSource History
# Works with PSReadLine >=v2.2.0
Set-PSReadLineOption -PredictionViewStyle ListView

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

(Get-PSReadLineOption).HistorySearchCursorMovesToEnd=$TRUE

# Aliases
Function gitChekout {
  param ([switch]$b)
  if ($b) { git checkout -b $args }
  else { git checkout $args }
}
Set-Alias -Name gco -Value gitChekout

Function gitPull { git pull }
Set-Alias -Name gpull -Value gitPull

Function gitChekoutAndPull {
  git checkout $args[0]
  git pull
}
Set-Alias -Name gcp -Value gitChekoutAndPull

Function deleteLocalBranch {
  git branch -d $args
}
Set-Alias -Name gdel -Value deleteLocalBranch

Function listBranches {
  if (!$args) { git branch }
  else {
    if ($args[0].Equals('-a')) { git branch -a }
    if ($args[0].Equals('-r')) { git branch -r }
  }
}
Set-Alias -Name lsb -Value listBranches

Function gitAdd { git add . }
Set-Alias -Name gadd -Value gitAdd

Function gitCommit { git commit -m $args }
Set-Alias -Name gcomm -Value gitCommit

Function gitPush { git push origin HEAD }
Set-Alias -Name gpush -Value gitPush

Function addCommitPush {
  git add .
  git commit -m $args
  git push origin HEAD
}
Set-Alias -Name acp -Value addCommitPush

# Enable starship prompt
Invoke-Expression (&starship init powershell)
