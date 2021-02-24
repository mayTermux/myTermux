<p align="center">
  <a name="top" href="#octocat-hi-there-thanks-for-visiting-">
     <img alt="owl4ce/dotfiles" height="60%" width="100%" src="https://i.ibb.co/CHhrkD2/window-2021-01-24-09-47-39-removebg-preview.png"/>
  </a>
</p>

##  
### :octocat: Hi, thanks for spending your tiime visiting this repository ! <img alt="" align="right" src="https://badges.pufler.dev/visits/xshin404/myTermux?style=flat-square&label=&color=fa74b2&logo=GitHub&logoColor=white&labelColor=373e4d"/> <img alt="" align="right" src="https://img.shields.io/github/repo-size/xshin404/myTermux?style=flat-square&label=Repo%20Size&color=cf8ef4&labelColor=373e4d"/>

This is my personal termux configuration, it is the result of a combination of several dotfiles from other people's repositories such as <a href="https://github.com/owl4ce/">owl4ce</a>.

I hope you understand my bad english. :sweat_smile:

Here are some details about my setup
- **Shell**                        • [ZSH](https://wiki.archlinux.org/index.php/zsh) :shell: with [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) framework + plugins
- **Music**                        • [MPD](https://wiki.archlinux.org/index.php/Music_Player_Daemon) :musical_note: with [ncmpcpp](https://wiki.archlinux.org/index.php/ncmpcpp) text-mode client for MPD
- **Color Scheme**                 • [Dotfiles](https://github.com/owl4ce/dotfiles/) :art:
- **Text Editor**                  • [Neovim](https://neovim.io) :ledger: + plugins
- **System Information**           • [Neofetch](https://github.com/dylanaraps/neofetch/wiki) :gear:

### Installation

  <details open>
  <summary>Termux (Android)</summary>
  
  - ```bash
    $ pkg install git
    ```

  - ```bash
    $ git clone https://github.com/xshin404/myTermux
    ```

  - ```bash
    $ cd myTermux
    ```

  - ```bash
    $ cp .xshin.var $HOME # For Setup Global Variable
    ```

  - ```bash
    $ chmod +x install.sh && ./install.sh --options # You can see the options with ./install.sh -h or --help
    ```

  Make sure you allow Termux to access your storage
  <details open>
  <summary>See</summary>

  |Termux Permission|
  |--|
  |![Image](/assets/images/permission/storage.png)|

  </details>

### Help

  <details open>
  <summary>See</summary>

  |Installation Help|
  |--|
  |![Image](/assets/images/help/help.png)|

  </details>

  </details>

### First Impression

  <details open>
  <summary>See</summary>

  |Views|
  |--|
  ![Image](/assets/images/first-impression/first-impression.jpg)

  </details>

### Check The Installed Packages + Size

  <details open>
  <summary>See</summary>

  |Packages + Size|
  |--|
  |![Image](/assets/images/checkpkgs/list.png)|

  `listpkg --options` for example i installed it with --standar. So i run `listpkg standar`

  </details>

### User Configuration

  <details open>
  <summary><strong>Ncmpcpp</strong></summary>

  |Dark Theme Sound Ellipse|Dark Theme Sound Wave Filled|
  |--|--|
  |![Black-1](/assets/images/ncmpcpp/black-1.png)|![Black-2](/assets/images/ncmpcpp/black-2.png)|

  |Light Theme Sound Ellipse|Light Theme Sound Wave Filled|
  |--|--|
  |![White-1](/assets/images/ncmpcpp/white-1.png)|![White-2](/assets/images/ncmpcpp/white-2.png)|

  To change Ncmpcpp configuration you can edit this file `~/.config/ncmpcpp/config`

  </details>


  <details open>
  <summary><strong>Neofetch</strong></summary>

  |Neofetch Battery|Neofetch Storage|
  |--|--|
  |![Image](/assets/images/neofetch/battery.png)|![Image](/assets/images/neofetch/storage.png)|

  |Neofetch Configuration|Neofetch Script|
  |--|--|
  |![Image](/assets/images/neofetch/config.png)|![Image](/assets/images/neofetch/script.png)|

  To change Neofetch configuration you can edit its config file in `~/.config/neofetch/config.conf` & `~/.config/neofetch/script.sh`

  </details>

  <details open>
  <summary><strong>Neovim</strong></summary>

  |Vim Plug|Plugin Status|Neovim View|
  |--|--|--|
  |![Image](/assets/images/neovim/plug.png)|![Image](/assets/images/neovim/status.png)|![Image](/assets/images/neovim/look.png)|

  To change the configuration of Neovim you can edit its config file in `~/.config/nvim/init.vim` & `~/.local/share/nvim/site/plug.vim`. <br>Then you can type <strong>`:PlugInstall`</strong> inside Neovim to install plugins (vim-plug).
  </details>

  <details>
  <summary><strong>SSH</strong></summary>

  |SSH View|
  |--|
  |![Image](/assets/images/ssh/look.png)|

  </details>


### Troubleshooting

  <details open>
  <summary><strong>Global Variable</strong></summary>

  - **ERROR : Please Setting Up Global Variable First !**

  This error is due to missing <strong>.xshin.var</strong>. To fix this, run `cp .xshin.var $HOME`

  |ERROR : Please Setting Up Global Variable First !|Fix|
  |--|--|
  |![Image](/assets/images/troubleshooting/variable/variable.png)|![Image](/assets/images/troubleshooting/variable/fix.png)|

  </details>


  <details open>
  <summary><strong>exa</strong></summary>

  - **"ls" unknown argument --icons**

  This error is because of an old version of `exa` that doesn't support `--icons` argument. To fix this please use `exa v.0.9.0`. <br>In my case, it is because of my old `sources.list`. On the first `pkg update`, you should answer `y` when asked whether you wanna keep your current version or switch to the package maintainer's version. Please switch it to the maintainer's version.

  |apt|motd|exa v.0.9.0|
  |--|--|--|
  |![Image](/assets/images/troubleshooting/exa/apt.jpg)|![Image](/assets/images/troubleshooting/exa/motd.jpg)|![Image](/assets/images/troubleshooting/exa/exa_version.jpg)

  </details>


  <details open>
  <summary><strong>Ncmpcpp</strong></summary>

  - **Music doesn't automatic detect**

  This error is because of the music PATH not directed to the right one. For example my music directory is in `/sdcard/Music/` or `~/storage/music/`. Please set it up to your own music folder.

  |PATH Music Ncmpcpp|
  |--|
  |![Image](/assets/images/troubleshooting/ncmpcpp/path.png)|

  </details>

  <details open>
  <summary><strong>Neofetch</strong></summary>

  - **Battery & Storage icon not showing**

  If you want Battery icon showing you have to install <strong>Termux-API</strong> app from the same source as your installed Termux (whether from PlayStore or F-Droid). Though it is recommended for you to install Termux from F-Droid. <br>For storage info you must set it to the right partition on your Android (e.g `/storage/emulated`).
  > NOTE:
  > Please run `df -h` to know where your internal partition is located.

  |Termux-API|Storage|
  |--|--|
  |![Image](/assets/images/troubleshooting/neofetch/api.png)|![Image](/assets/images/troubleshooting/neofetch/partitions.png)

  </details>

  <details open>
  <summary><strong>"pkg" or "apt"</strong></summary>

  - **Unable to locate package "..."**

  This error is perhaps because of you execute the `install.sh` script before updating the repository. <br>Please make sure to run `pkg update` or `apt update` before you run the installation script. After running `pkg update` now you can run the installation script again.

  |Unable to locate package|Unable to locate package|
  |--|--|
  |![Image](/assets/images/troubleshooting/package/error.png)|![Image](/assets/images/troubleshooting/package/error2.png)|

  </details>

  ## :hearts:  Credits / Thanks
  - **Inspiration**
    - [Harry](https://github.com/owl4ce)
    - [adi1090x](https://github.com/adi1090x)

  - **Knowledge**
    - [Rizqi Nur Assyaufi](https://github.com/bandithijo)
    - [Ann](https://github.com/annzc)

  - **Other**
    - [Ricing Group](https://t.me/dotfiles_id)
    - [Oh-My-ZSH](https://github.com/ohmyzsh/ohmyzsh)
    - [MPD](https://wiki.archlinux.org/index.php/Music_Player_Daemon)
    - [Ncmpcpp](https://wiki.archlinux.org/index.php/ncmpcpp)
    - [Dotfiles](https://github.com/owl4ce/dotfiles)
    - [Neovim](https://neovim.io)
    - [Vim Plug](https://github.com/junegunn/vim-plug)
    - [Neofetch](https://github.com/dylanaraps/neofetch)
    - [youtube-dl](https://youtube-dl.org)
