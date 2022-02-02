# zsh_setup_automation
Automating my ZSH setup

This is what my terminal currently looks like with the setup.

![Current setup screenshot](https://user-images.githubusercontent.com/12295171/151579199-85e70180-8d0b-41c1-b920-38533c042ee7.png)

## The setup
1. Uses [Font FiraCode][firacode] with [Nerd-font patch][nerd-font]. (The font needs to be set manually in the terminal and VS Code settings.)  
**Note:** You need to use a terminal emulator that supports font ligatures. Otherwise your terminal will show ugly squares in place of symbols that it doesn't understand. Click [here][firacode-supported-terminals] to find a list of terminals, that FiraCode thinks, support it.
2. Uses [Zsh][zsh] shell with the [Oh-my-Zsh][oh-my-zsh] configuration framework.
3. Uses [Powerlevel10k][p10k] theme. (More like a theme engine really)
4. [Oh-My-Zsh plugins][oh-my-zsh-plugins] used: (colored-man-pages colorize command-not-found httpie rand-quote)

## How to run the setup
1. Clone this repo.
2. Run the install script. Currently, only debian-based systems are supported (Ubuntu, Kubuntu, etc.)
    ```
    ./setup-debian.sh
    ```
    Note: You may be required to input your password a few times while the script is running.  
    **DO NOT** use sudo to run the script as that might change the shell for the root user and not yours.

[firacode]: https://github.com/tonsky/FiraCode
[nerd-font]: https://www.nerdfonts.com
[zsh]: https://opensource.com/article/19/9/getting-started-zsh
[oh-my-zsh]: https://ohmyz.sh
[p10k]: https://github.com/romkatv/powerlevel10k
[oh-my-zsh-plugins]: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
[firacode-supported-terminals]: https://github.com/tonsky/FiraCode#terminal-compatibility-list
