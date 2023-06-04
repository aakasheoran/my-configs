# function to save unique history
# fish_postexec - runs after every command is finished executing
# fish_preexec - use this event to make this function run before every command is executed  
function save_unique_history --on-event fish_postexec --description 'save unique history'
  history delete --exact --case-sensitive -- $argv  # delete any duplicates
  history merge # merge with existing history
  history save  # save history
end