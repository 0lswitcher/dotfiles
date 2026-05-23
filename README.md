[![Typing SVG](https://readme-typing-svg.demolab.com?font=Fira+Code&size=30&duration=2500&pause=1000&color=B277F7&vCenter=true&width=500&lines=0lswitcher's+UNIX+Dotfiles)](https://git.io/typing-svg)

My collection of dotfiles for different applications that I considered noteworthy.\
No install scripts, just pure dotfiles.


> [!TIP]
> If you're looking for bash scripts, take a look at my [bash-scripts](https://github.com/0lswitcher/bash-scripts) repository since I've moved them there.
> 
> If you're instead looking for NixOS configuration files, take a look at my [nixfiles](https://github.com/0lswitcher/nixfiles) repository since I've moved them there.


### Installation
---
My dotfiles now use [GNU Stow](https://www.gnu.org/software/stow/) for management, so installation is easier than ever.

<details>
<summary>What is GNU Stow?</summary>
According to the gnu.org site:<br>
"GNU Stow is a symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place."
</details>

To begin installation, first clone the repository to your `$HOME` directory:

```
$ git clone https://github.com/0lswitcher/dotfiles.git
```

> [!TIP]
> You can optionally clone the repository to any other desired directory in your system, just make sure you know how to use `stow` with `-t` flag set to your `$HOME` directory.

Next, ensure you have `stow` installed in your systems package manager.\
With `stow` installed, getting the dotfiles is as easy as removing or backing up any previous dots you want to change:\
*(I'll use hyprland for this example-)*
> *Removal:*
> ```
> $ rm -r ~/.config/hypr
> ```

Or, alternatively;

> *Backup:*
> ```
> $ mv ~/.config/hypr ~/.config/hypr.bk
> ```

Then, navigating to the cloned repository directory and running:

```
$ stow <desired-dotfile-name>
```

That's it! <br>

For example, if you want to use my hyprland dots, run:

```
$ stow hypr
```


<br>

### Documentation
---
I've written multiple `README`'s regarding different configs, so I highly encourage browsing deeper within the repository either through the links provided below, or by manually checking the file tree above.

> [!NOTE]
> If you don't see the package or configuration linked below, it doesn't have a `README` yet. Feel free to open an issue in the repository online, and I'll prioritize that `README` next.

| Package / Configuration | README?   |
| ----------------------- | --------- |
|[Bash](bash/README.md)                     | Yes!      |
|Btop                     | Not yet.. |
|Cava                     | Not yet.. |
|[Fastfetch](fastfetch/README.md)                | Yes!      |
|Foot                     | Not yet.. |
|Hyprland                 | Not yet.. |
|Kando                    | Not yet.. |
|Laptop Specific          | Not yet.. |
|Micro                    | Not yet.. |
|Neovim                   | Not yet.. |
|Ranger                   | Not yet.. |
|Spicetify                | Not yet.. |
|Ulauncher                | Not yet.. |
|Waybar                   | Not yet.. |
| ------- Theming: ------ |           |
| gtk-2.0                 | Not yet.. |
| gtk-3.0                 | Not yet.. |
| gtk-4.0                 | Not yet.. |
| nwg-look                | Not yet.. |
| qt5ct                   | Not yet.. |
|[qt6ct](theming/.config/qt6ct/README.md)                    | Yes!      |

<br>

> [!CAUTION]
> This is a WIP! If you're reading this message, there's still plenty to come, dotfile and documentation wise. If you're interested in seeing how things turn out, feel free to 'Watch' the repo via the menu on the right side. o7

