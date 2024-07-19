# Dotfiles

- the correct work email + ssh auth + ssh sign for git are automatically applied when working under **~/projects/work**
- ssh auth will be remembered after first use
- to remember ssh sign, you have to add it manually to the agent - `ssh-add ~/.ssh/<personal/work>-sign_ed25519`

#### TODO:

- automate: fix ctrl + space for auto-suggestion - keyboard shortcuts -> input sources (change language) - look into "defaults write ..." configs
- shift + tab when suggesting files/dirs when doing cd is not working
- ctrl + r invert where the input is (from bottom to top)
- automate make zsh the default shell
- fix: ssh signing keys are not added to ssh-agent when first used
- improve README

- automate: start colima at login
To start colima now and restart at login:
  brew services start colima
Or, if you don't want/need a background service you can just run:
  /opt/homebrew/opt/colima/bin/colima start -f
(from running start colima: Tapping homebrew/services)
