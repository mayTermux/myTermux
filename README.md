<h1 align="center">myTermux</h1>

<p align="center">This is my personal configuration for my favorite Termux</p>

<p align="center">
  <a href="./LICENSE"><img src="https://img.shields.io/badge/license-GPL-blue.svg"></a>
  <a href="https://github.com/mayTermux/awesomeshot/releases"><img src="https://img.shields.io/github/release/mayTermux/myTermux.svg"></a>
</p>

## Video Installation

> Click this thumbnail below to see video installation

[![myTermux Thumbnail](https://user-images.githubusercontent.com/64394320/170211137-554dfd78-8424-4699-876c-7483b45de068.png)](https://www.youtube.com/watch?v=sYkNxK_44Zg "myTermux - Installation")

## Installation Dependecies

> **Attention!**
>
> - [Termux must be **F-Droid** Version](https://f-droid.org/en/packages/com.termux/) because Termux from Playstore no longer maintained because there are some problems with the Playstore publishing
> - [Termux:API must be installed](https://f-droid.org/en/packages/com.termux.api/) myTermux use API command from Termux:API like fetch `termux-battery-status`

  <details open>
  <summary><strong>Update Repository & Upgrade Package</strong></summary>

```bash
pkg update && pkg upgrade
```

  </details>

  <details>
  <summary><strong>git & bc</strong></summary>

- Package `git` for cloning or downloading repository
- Package `bc` for calculate repository size which will be cloning or downloading

```bash
pkg i -y git bc
```

  </details>

## Installation myTermux

  <details open>
  <summary><strong>Clone or Download This Repository</strong></summary>

```bash
git clone --depth=1 https://github.com/mayTermux/myTermux.git
```

  </details>

  <details>
  <summary><strong>Run Script Installer</strong></summary>

- Move to Folder

```bash
cd myTermux
```

- export variable `COLUMNS` and `LINES`

> This variable function so that the installer script can read the
> `column` and `row` widths of Termux Application so that later it
> matches the output during the installation process.

```bash
export COLUMNS LINES
```

- Execute Installer

```bash
./install.sh
```

![Error](https://user-images.githubusercontent.com/64394320/170210843-a4ee5203-2892-4083-81a8-fe89981cac80.png)

> If you get error message `Please Zoom Out`.
> Zoom Out on Termux Application then run again the script

> If the row and column widths of the application are correct,
> the script will automatically run, like this:

![banner_out](https://user-images.githubusercontent.com/64394320/170211059-9d740d4f-b657-4da5-a319-a3e09af0be3b.png)

> Then follow the installation until it's finished

  </details>

## :camera_flash: Screenshots

> This screenshot take by [**Awesomeshot**](https://github.com/mayTermux/awesomeshot) and system fetch by [**rxfetch-termux**](https://github.com/mayTermux/rxfetch-termux)

- System Fetch

  > rxfetch

  ![rxfetch](https://user-images.githubusercontent.com/64394320/170211137-554dfd78-8424-4699-876c-7483b45de068.png)

  > neofetch

  ![neofetch_out](https://user-images.githubusercontent.com/64394320/170211168-9e44dab1-7047-4f12-985c-3608b93ee033.png)

- Colorscheme (Theme)

  > Change colorscheme or theme with command:

  ```bash
  chcolor
  ```

  ![chcolor_out](https://user-images.githubusercontent.com/64394320/170211188-69f6317f-31e5-4feb-8422-3b0912ec3f8d.png)

  <details>
  <summary>Show Preview</summary>

  ![colorscheme](https://i.ibb.co/4Vjdk89/out2.png)

  </details>

- Fonts

  > Change font used with command:

  ```bash
  chfont
  ```

  ![chfont_out](https://user-images.githubusercontent.com/64394320/170211200-74ffac55-3181-4b43-9faa-a076ba847a70.png)

- ZSH Theme

  > Change ZSH Theme with command:

  ```bash
  chzsh
  ```

  ![zsh_out](https://user-images.githubusercontent.com/64394320/170211230-059d59be-376b-440c-9fb9-ea3750c983b9.png)

- [NVIM] - Text Editor

  ![nvim_out](https://user-images.githubusercontent.com/64394320/170211252-e11d41cf-7674-40e5-b1f8-11ac3320a83f.png)

  <details>
  <summary>Show Theme</summary>

  ![NvChad Theme](https://i.ibb.co/6DqyPqT/final-text-editor.png)

  </details>

- [NCMPCPP] - Music Player

  ![music_out](https://user-images.githubusercontent.com/64394320/170211279-a26d0f0e-1cf8-4b8b-ae21-8a1a79515574.png)

- [COLORTOYS] - Pipes

  ![pipes](https://user-images.githubusercontent.com/66439853/178114136-25a80169-2413-4a92-ac4b-e0df649da5f2.png)

- [COLORTOYS] - Panes, Bar, Bloks

  ![panes-bar-bloks](https://user-images.githubusercontent.com/66439853/178114094-1e1a9956-46f9-446b-a527-86b61e9c77e0.png)

- [NYANCAT]

  ![nyancat_out](https://user-images.githubusercontent.com/64394320/170211265-40e42967-1aee-40ad-9a39-11e9a45139ee.png)

## Credits

- [siduck](https://github.com/siduck) Neovim Setup (NvChad), Colorscheme (onedark-siduck)
- [owl4ce](https://github.com/owl4ce) First time getting to know dotfiles
- [adi1090x](https://github.com/adi1090x) Termux Setup
- [bandithijo](https://github.com/bandithijo) Awesome screenshot like MacOS using imagemagick script
- [lwotcynna](https://github.com/lwotcynna) Contibutor
- [nekonako](https://github.com/nekonako) Colorscheme nekonako-djancoeg, nekonako-hue, nekonako-om-mar
- [Dotfiles Indonesia](https://t.me/dotfiles_id)
- [Vim Indonesia](https://t.me/VimID)
- [Bashid.org](https://t.me/bashidorg)

## Colorscheme

- [catppuccin/termux](https://github.com/catppuccin/termux)
