# my dotfiles

These work for me, your mileage may vary!

## Install

Install yadm using their [guide](https://yadm.io/docs/install)

`yadm clone https://github.com/mattdavis90/dotfiles`

*Warning: This will overwrite existing files. See the yadm [docs](https://yadm.io/) for details*

## Run bootstrap

The bootstrap script will run a sparse-checkout to remove the `README.md` and `UNLICENSE` files from `$HOME`

## What's Included

- Alacritty
  - Hack Nerd Font
  - Save to clipboard on highlight
  - Key bindings
    - Toggle Fullscreen - Ctrl+Shift+F11
    - New window - Ctrl+Shift+N
    - Send change buffer (Ctrl+^) to vim - Ctrl+6
    - Append previous argument in zsh - Alt+.
  - Custom theme based on [Sonokai](https://github.com/sainnhe/sonokai)

- ZSH
  - Zplug configuration
  - Plugins from Prezto for
    - [environment](https://github.com/sorin-ionescu/prezto/blob/master/modules/environment/README.md)
    - [completion](https://github.com/sorin-ionescu/prezto/blob/master/modules/completion/README.md)
    - [directory](https://github.com/sorin-ionescu/prezto/blob/master/modules/directory/README.md)
      - Note: this plugin disable clobber, I re-enable it
    - [history](https://github.com/sorin-ionescu/prezto/blob/master/modules/history/init.zsh)
      - Note: this plugin enables shared history, I disable it
  - ZSH Users additional [completions](https://github.com/zsh-users/zsh-completions)
  - ZSH Users [substring search](https://github.com/zsh-users/zsh-history-substring-search)
  - Oh-my-zsh [keybindings](https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/key-bindings.zsh)
  - Set `nonomatch` so that we can send a glob as an arg if it doens't match
  - Custom theme
    - Two line PROMPT
    - Shows the follwing information
      - Git branch
      - Git status (dirty, staged, untracked, etc.)
      - Git hash
      - Python virtual-env
      - Last command status
      - Time when prompt was drawn
      - Number of background jobs
  - Add $HOME/bin to $PATH
  - Load Python's virtualenvwrapper
  - Load up NVM
  - Aliases for coloured ls, grep, ll, and nvim
  - vim as EDITOR

- Tmux
  - Ctrl-A as prefix
  - Windows in the centre bottom
  - Battery status on the right
  - Following plugins
    - Battery status
    - Continuum
    - Resuurect
    - Sensible
    - Yank
    - TPM
  - Custom theme based on [Sonokai](https://github.com/sainnhe/sonokai)

- Gitconfig
  - This is my gitconfig - you probably don't want this :D

- Lazygit
  - Make the colours look ok inside toggleterm in Neovim

- nvim
  - Too many plugins to list...

