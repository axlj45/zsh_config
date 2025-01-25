if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

export NVM_COMPLETION=true
export NVM_SYMLINK_CURRENT=true

export DOTNET_CLI_TELEMETRY_OPTOUT=1
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1
export PATH="$PATH:$HOME/.dotnet/tools"

export PATH=$HOME/development/flutter/bin:$PATH
export PATH="/usr/local/anaconda3/bin:$PATH"
export PATH="$HOME/flutter/flutter:$PATH"
export PATH="$PATH:/usr/local/bin"
export PATH=$HOME/.gem/bin:$PATH
export PATH="/usr/local/opt/libpq/bin:$PATH"

. "$HOME/.cargo/env"
