<p align="center">
  <a name="top" href="#octocat-hi-there-thanks-for-visiting-">
     <img alt="owl4ce/dotfiles" height="60%" width="100%" src="https://i.ibb.co/CHhrkD2/window-2021-01-24-09-47-39-removebg-preview.png"/>
  </a>
</p>

<p align="center">
  <a href="#rice_scene--setup">
    <img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/qk3nSfh/install.png"/>
  </a>
  <a href="#">
    <img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/xmdtYT8/packages.png"/>
  </a>
  <a href="#">
    <img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/qJ6BrwX/themes.png"/>
  </a>
  <a href="#memo--notes">
    <img width="120px" style="padding: 0 10px;" src="https://i.ibb.co/tHzTR8D/music.png"/>
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
- **Text Editor**                  • [Neovim](https://neovim.io/charter/) :ledger: + plugins
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
    $ chmod +x install.sh && ./install.sh --options # You can see options with ./install.sh -h or --help
    ```

### Help

  ![Image](/assets/images/help/help.png)

### User Configuration

  <details open>
  <summary>ncmpcpp</summary>

  |Dark Theme Ellipse|Dark Theme Wave Filled|Light Theme Ellipse|White Theme Wave Filled|
  |--|--|--|--|
  |![Image](/assets/images/ncmpcpp/ncmpcpp_black1.jpg)|![Image](/assets/images/ncmpcpp/ncmpcpp_black2.jpg)|![Image](/assets/images/ncmpcpp/ncmpcpp_white1.jpg)|![Image](/assets/images/ncmpcpp/ncmpcpp_white2.jpg)|

  if ncmpcpp doesn't detect music you can change PATH Music in your case, for example in my case Music in directory "/storage/emulated/0/music" or "/sdcard/Music"
  [`~/.config/ncmpcpp/config`](./.config/neofetch/config.conf`)
  ```cfg
  ...

  |PATH Music|
  |--|
  |![Image](/assets/images/ncmpcpp/config_edited.png)
  
