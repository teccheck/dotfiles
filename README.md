# My dotfiles

These are my no-so-special dotfiles. I manage them using stow.

## Installation

1. Install `stow`
2. Clone repo into home dir
3. Inside cloned repo run `stow .`


## Dotfiles fixes
There are a few fixes for misplaced dotfiles in `envvars.conf`, but some programs need more.

### Android Studio (Flatpak)
Use flatseal to add 
* `ANDROID_SDK_HOME=[USER_HOME]/.local/share/android`
* `ANDROID_SDK_ROOT=[USER_HOME]/.local/share/android`
* `GRADLE_USER_HOME=[USER_HOME]/.local/share/gradle`

