# Font mode
typeset -g POWERLEVEL9K_MODE='nerdfont-complete'

# Remove End of line symbol
typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=

# Directory settings
typeset -g POWERLEVEL9K_DIR_BACKGROUND='237'
typeset -g POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="clear"
typeset -g POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="012"
typeset -g POWERLEVEL9K_DIR_FOREGROUND='010'
typeset -g POWERLEVEL9K_DIR_HOME_BACKGROUND="clear"
typeset -g POWERLEVEL9K_DIR_HOME_FOREGROUND="012"
typeset -g POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="clear"
typeset -g POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="012"
typeset -g POWERLEVEL9K_DIR_PATH_SEPARATOR="%F{008}/%F{cyan}"

typeset -g POWERLEVEL9K_DIR_ETC_BACKGROUND="clear"
typeset -g POWERLEVEL9K_ETC_ICON='%F{blue}\uf423'
typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="clear"

typeset -g POWERLEVEL9K_HOME_ICON="\u03bb"  # Unicode for λ

typeset -g POWERLEVEL9K_SHORTEN_DELIMITER='%F{008} …%F{008}'
typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY="none"

# Left prompt
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir dir_writable_joined vcs_joined)
typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='%F{008}\uf460%F{008}'

typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" \uf101 "

typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
typeset -g POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Right prompt
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status time go_version nvm os_icon)
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%F{008}\uf104%F{008}'

typeset -g POWERLEVEL9K_NVM_BACKGROUND='clear'
typeset -g POWERLEVEL9K_NVM_FOREGROUND='green'

typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND='clear'
typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND='cyan'

# Status of previous operation
typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND="001"
typeset -g POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
typeset -g POWERLEVEL9K_STATUS_BACKGROUND="clear"
typeset -g POWERLEVEL9K_CARRIAGE_RETURN_ICON="\uf071"

# Version Control system (like Git)
typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND='clear'
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='clear'
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='yellow'
typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='clear'
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='green'

###################[ command_execution_time: duration of the last command ]###################
# Show duration of the last command if takes at least this many seconds.
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
# Show this many fractional digits. Zero means round to seconds.
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
# Execution time color.
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=212
# Execution time background
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=clear
# Duration format: 1d 2h 3m 4s.
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
# Custom icon.
# typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION=
# Custom prefix.
# typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PREFIX='%ftook '


################[ goenv: go environment (https://github.com/syndbg/goenv) ]################
# Goenv color.
typeset -g POWERLEVEL9K_GOENV_FOREGROUND=37
# Hide go version if it doesn't come from one of these sources.
typeset -g POWERLEVEL9K_GOENV_SOURCES=(shell local global)
# If set to false, hide go version if it's the same as global:
# $(goenv version-name) == $(goenv global).
typeset -g POWERLEVEL9K_GOENV_PROMPT_ALWAYS_SHOW=false
# If set to false, hide go version if it's equal to "system".
typeset -g POWERLEVEL9K_GOENV_SHOW_SYSTEM=true
# Custom icon.
# typeset -g POWERLEVEL9K_GOENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

typeset -g POWERLEVEL9K_GO_ICON="\uf7b7"
typeset -g POWERLEVEL9K_GO_VERSION_BACKGROUND='clear'
typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND='081'

##########[ nodenv: node.js version from nodenv (https://github.com/nodenv/nodenv) ]##########
# Nodenv color.
typeset -g POWERLEVEL9K_NODENV_FOREGROUND=70
# Hide node version if it doesn't come from one of these sources.
typeset -g POWERLEVEL9K_NODENV_SOURCES=(shell local global)
# If set to false, hide node version if it's the same as global:
# $(nodenv version-name) == $(nodenv global).
typeset -g POWERLEVEL9K_NODENV_PROMPT_ALWAYS_SHOW=false
# If set to false, hide node version if it's equal to "system".
typeset -g POWERLEVEL9K_NODENV_SHOW_SYSTEM=true
# Custom icon.
# typeset -g POWERLEVEL9K_NODENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

##############[ nvm: node.js version from nvm (https://github.com/nvm-sh/nvm) ]###############
# Nvm color.
typeset -g POWERLEVEL9K_NVM_FOREGROUND=70
# Custom icon.
# typeset -g POWERLEVEL9K_NVM_VISUAL_IDENTIFIER_EXPANSION='⭐'

############[ nodeenv: node.js environment (https://github.com/ekalinin/nodeenv) ]############
# Nodeenv color.
typeset -g POWERLEVEL9K_NODEENV_FOREGROUND=70
# Don't show Node version next to the environment name.
typeset -g POWERLEVEL9K_NODEENV_SHOW_NODE_VERSION=false
# Separate environment name from Node version only with a space.
typeset -g POWERLEVEL9K_NODEENV_{LEFT,RIGHT}_DELIMITER=
# Custom icon.
# typeset -g POWERLEVEL9K_NODEENV_VISUAL_IDENTIFIER_EXPANSION='⭐'

##############################[ node_version: node.js version ]###############################
# Node version color.
typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=70
# Show node version only when in a directory tree containing package.json.
typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true
# Custom icon.
# typeset -g POWERLEVEL9K_NODE_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

#######################[ go_version: go version (https://golang.org) ]########################
# Go version color.
typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND=37
# Show go version only when in a go project subdirectory.
typeset -g POWERLEVEL9K_GO_VERSION_PROJECT_ONLY=true
# Custom icon.
# typeset -g POWERLEVEL9K_GO_VERSION_VISUAL_IDENTIFIER_EXPANSION='⭐'

####################################[ time: current time ]####################################
# Current time color.
typeset -g POWERLEVEL9K_TIME_FOREGROUND=66
# Current time background color.
typeset -g POWERLEVEL9K_TIME_BACKGROUND=clear
# Format for the current time: 09:51:02. See `man 3 strftime`.
typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%I:%M:%S %p}'
# If set to true, time will update when you hit enter. This way prompts for the past
# commands will contain the start times of their commands as opposed to the default
# behavior where they contain the end times of their preceding commands.
typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false
