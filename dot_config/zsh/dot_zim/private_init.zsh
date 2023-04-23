zimfw() { source /home/jeroen/.config/zsh/.zim/zimfw.zsh "${@}" }
zmodule() { source /home/jeroen/.config/zsh/.zim/zimfw.zsh "${@}" }
fpath=(/home/jeroen/.config/zsh/.zim/modules/git/functions /home/jeroen/.config/zsh/.zim/modules/zim-rtx/functions /home/jeroen/.config/zsh/.zim/modules/utility/functions /home/jeroen/.config/zsh/.zim/modules/k/functions /home/jeroen/.config/zsh/.zim/modules/zim-starship/functions /home/jeroen/.config/zsh/.zim/modules/zsh-completions/src /home/jeroen/.config/zsh/.zim/modules/zim-chezmoi/functions /home/jeroen/.config/zsh/.zim/modules/zim-github-cli/functions ${fpath})
autoload -Uz -- git-alias-lookup git-branch-current git-branch-delete-interactive git-branch-remote-tracking git-dir git-ignore-add git-root git-stash-clear-interactive git-stash-recover git-submodule-move git-submodule-remove mkcd mkpw k
source /home/jeroen/.config/zsh/.zim/modules/environment/init.zsh
source /home/jeroen/.config/zsh/.zim/modules/git/init.zsh
source /home/jeroen/.config/zsh/.zim/modules/input/init.zsh
source /home/jeroen/.config/zsh/.zim/modules/termtitle/init.zsh
source /home/jeroen/.config/zsh/.zim/modules/zim-rtx/init.zsh
source /home/jeroen/.config/zsh/.zim/modules/utility/init.zsh
source /home/jeroen/.config/zsh/.zim/modules/asdf/init.zsh
source /home/jeroen/.config/zsh/.zim/modules/exa/init.zsh
source /home/jeroen/.config/zsh/.zim/modules/k/init.zsh
source /home/jeroen/.config/zsh/.zim/modules/fzf/init.zsh
source /home/jeroen/.config/zsh/.zim/modules/zim-starship/init.zsh
source /home/jeroen/.config/zsh/.zim/modules/completion/init.zsh
source /home/jeroen/.config/zsh/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/jeroen/.config/zsh/.zim/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
source /home/jeroen/.config/zsh/.zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/jeroen/.config/zsh/.zim/modules/zim-zoxide/init.zsh
source /home/jeroen/.config/zsh/.zim/modules/zim-chezmoi/init.zsh
source /home/jeroen/.config/zsh/.zim/modules/zim-github-cli/init.zsh
source /home/jeroen/.config/zsh/.zim/modules/zsh-fzf-history-search/zsh-fzf-history-search.zsh
