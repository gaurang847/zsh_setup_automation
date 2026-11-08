# zsh_setup_automation
Automating my ZSH setup

This is what my terminal currently looks like with the setup.

![Current setup screenshot](https://user-images.githubusercontent.com/12295171/151579199-85e70180-8d0b-41c1-b920-38533c042ee7.png)

## The setup
1. Uses [Font FiraCode][firacode] with [Nerd-font patch][nerd-font]. (The font needs to be set manually to **FiraCode Nerd Font** in your terminal emulator and VS Code settings.)  
**Note:** You need to configure your terminal to use **FiraCode Nerd Font** to display icons and prompt symbols properly. Additionally, using a terminal emulator that supports font ligatures is recommended for code ligatures. Click [here][firacode-supported-terminals] to find a list of terminals that support ligatures.
2. Uses [Zsh][zsh] shell with the [Oh-my-Zsh][oh-my-zsh] configuration framework.
3. Uses [Powerlevel10k][p10k] theme engine configured with a custom Masquerade style.
4. [Oh-My-Zsh plugins][oh-my-zsh-plugins] used: `colored-man-pages`, `colorize`, `command-not-found`, `httpie`, and `rand-quote`.

## How to run the setup
1. Clone this repo.
2. Run the install script. Currently, debian-based systems are supported (Ubuntu, Kubuntu, Pop!_OS, Debian, etc.):
    ```bash
    ./setup-debian.sh
    ```
    *Note:* You may be required to input your sudo password while the script installs package prerequisites.  
    **DO NOT** run the script itself with `sudo` (e.g. `sudo ./setup-debian.sh`), as that will configure and change the default shell for `root` instead of your user account.  
    *(If an existing `~/.zshrc` is detected, a timestamped backup `~/.zshrc.bak.<timestamp>` will automatically be created before copying the new configuration).*
3. Logout and login again for the default shell changes to take full effect.

## How to undo the setup
If you ever want to revert back to your default settings:
1. Run the undo script:
    ```bash
    ./undo-debian.sh
    ```
    This script will:
    - Revert your default shell back to Bash.
    - Restore your original `~/.zshrc` from the backup.
    - Remove Oh-My-Zsh (`~/.oh-my-zsh`) and Powerlevel10k.
    - Remove FiraCode Nerd Font from `~/.local/share/fonts`.
    - Offer to optionally uninstall packages installed for this setup (`zsh`, `python3-pygments`).
2. Logout and login again for the shell change to take effect.

[firacode]: https://github.com/tonsky/FiraCode
[nerd-font]: https://www.nerdfonts.com
[zsh]: https://opensource.com/article/19/9/getting-started-zsh
[oh-my-zsh]: https://ohmyz.sh
[p10k]: https://github.com/romkatv/powerlevel10k
[oh-my-zsh-plugins]: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
[firacode-supported-terminals]: https://github.com/tonsky/FiraCode#terminal-compatibility-list
