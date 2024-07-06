ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME ]]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git $ZINIT_HOME
fi

source $ZINIT_HOME/zinit.zsh

zinit ice depth=1; zinit light romkatv/powerlevel10k

for config_file ($HOME/.zsh/extensions/*.zsh) source $config_file