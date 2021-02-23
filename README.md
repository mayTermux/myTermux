<p align="center">
  <a name="top" href="#octocat-hi-there-thanks-for-visiting-">
     <img alt="owl4ce/dotfiles" height="60%" width="100%" src="https://i.ibb.co/CHhrkD2/window-2021-01-24-09-47-39-removebg-preview.png"/>
  </a>
</p>

##  
### :octocat: Hi, thanks for spending your time visiting this repository ! <img alt="" align="right" src="https://badges.pufler.dev/visits/xshin404/myTermux?style=flat-square&label=&color=04f8d5&logo=GitHub&logoColor=white&labelColor=373e4d"/>

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

### Help

  ![Image](/assets/images/help/help.png)

  </details>

### First Impression

  ![Image](/assets/images/first-impression/first-impression.jpg)

### Check Packages Installed + Size

   `listpkg --options` for example i installed it with --zsh. So i run `listpkg zsh`

   ![Image](/assets/images/checkpkgs/packages.png)

### User Configuration

  <details open>
  <summary><strong>Ncmpcpp</strong></summary>

  |Dark Theme Sound Ellipse|Dark Theme Sound Wave Filled|
  |--|--|
  |![Image](/assets/images/ncmpcpp/ncmpcpp_black1.jpg)|![Image](/assets/images/ncmpcpp/ncmpcpp_black2.jpg)|

  |Light Theme Sound Ellipse|Light Theme Sound Wave Filled|
  |--|--|
  |![Image](/assets/images/ncmpcpp/ncmpcpp_white1.jpg)|![Image](/assets/images/ncmpcpp/ncmpcpp_white2.jpg)|

  To change configuration Ncmpcpp you can edit file in `~/.config/ncmpcpp/config`

  </details>


  <details open>
  <summary><strong>Neofetch</strong></summary>

  |Neofetch Battery|Neofetch Storage|
  |--|--|
  |![Image](/assets/images/neofetch/neofetch_battery.jpg)|![Image](/assets/images/neofetch/neofetch_output.jpg)|

  |Neofetch Configuration|Neofetch Script|
  |--|--|
  |![Image](/assets/images/neofetch/neoconf.jpg)|![Image](/assets/images/neofetch/neoscript.jpg)|

  To change configuration Neofetch you can edit file in `~/.config/neofetch/config.conf` & `~/.config/neofetch/script.sh`

  </details>

  <details open>
  <summary><strong>Neovim</strong></summary>

  |Vim Plug|Plug Status|Neovim|
  |--|--|--|
  |![Image](/assets/images/neovim/vimplug.jpg)|![Image](/assets/images/neovim/plugstatus.jpg)|![Image](/assets/images/neovim/neovim_output.jpg)|

  To change configuration Neovim you can edit file in `~/.config/nvim/init.vim` & `~/.local/share/nvim/site/plug.vim`. If you want to install the plugin, you can type <strong>:PlugInstall</strong> in Neovim.
  </details>

  <details>
  <summary><strong>SSH</strong></summary>

  |SSH|
  |--|
  |![Image](/assets/images/ssh/ssh.jpg)|

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

  This error because exa old version not support argument --icons, to fix this use exa v.0.9.0. In my case i use the package maintainer's version on first update & upgrade.

  |apt|motd|exa v.0.9.0|
  |--|--|--|
  |![Image](/assets/images/troubleshooting/exa/apt.jpg)|![Image](/assets/images/troubleshooting/exa/motd.jpg)|![Image](/assets/images/troubleshooting/exa/exa_version.jpg)

  </details>


  <details open>
  <summary><strong>Ncmpcpp</strong></summary>

  - **Music doesn't automatic detect**

  This error because the music PATH is not directed to the right one, for example my directory music in "/sdcard/Music" or "/storage/emulated/0/music". You can set to your music folder you want.

  |PATH Music Ncmpcpp|
  |--|
  |![Image](/assets/images/troubleshooting/ncmpcpp/music.png)|

  </details>

  <details open>
  <summary><strong>Neofetch</strong></summary>

  - **Battery & Storage icon not showing**

  If you want Battery icon showing you must install app <strong>Termux-API</strong> and for storage you must set to right partition on your Android.

  |Termux-API|Storage|
  |--|--|
  |![Image](/assets/images/troubleshooting/neofetch/termux-api.jpg)|![Image](/assets/images/troubleshooting/neofetch/storage.png)

  </details>

  <details open>
  <summary><strong>"pkg" or "apt"</strong></summary>

  - **Unable to locate package "..."**

  This error because install before update repository, to fix this run "pkg" or "apt" update to get repository newest and then run again installation script.

  |Unable to locate package|Unable to locate package|
  |--|--|
  |![Image](/assets/images/troubleshooting/package/package.jpg)|![Image](/assets/images/troubleshooting/package/package2.jpg)|

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
