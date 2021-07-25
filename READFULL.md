<p align="center">
  <a name="top" href="#octocat-hi-there-thanks-for-visiting-">
     <img alt="myTermux Banner" height="60%" width="100%" src="/assets/images/banner/banner2.png"/>
  </a>
</p> <img alt="" align="right" src="https://badges.pufler.dev/visits/xshin404/myTermux?style=flat-square&label=Visits&color=fa74b2&logo=GitHub&logoColor=white&labelColor=373e4d"/> <img alt="" align="right" src="https://img.shields.io/github/repo-size/xshin404/myTermux?style=flat-square&label=Size&color=fa74b2&labelColor=373e4d"/>


##  
### :octocat: Hi, thanks for spending your time visiting this repository!

I hope you understand my bad english. :sweat_smile:

These are dotfiles or my personal Termux configuration. But I didn't make all of them (combined from several repositories).

### Installation

  <details open>
  <summary>Termux (Android)</summary>

  - ```bash
    $ pkg update && pkg upgrade
    ```

  - ```bash
    $ pkg install ncurses-utils bc git
    ```

  - ```bash
    $ git clone https://github.com/xshin404/myTermux
    ```

  - ```bash
    $ cd myTermux
    ```

  - ```bash
    $ cp .xshin.var $HOME # Setup global variable
    ```

  - ```bash
    $ chmod +x install.sh
    ```

  - ```bash
    $ ./install.sh [options] # You can see the options with './install.sh help'
    ```

### Installation Help

  <details>
  <summary>See</summary>

  |Installation Help|
  |--|
  |![Image](/assets/images/help/help.jpg)|

  </details>

  </details>

### Default Termux Login

|Termux Login|
|--|
|![Termux Login](/assets/images/login/login.jpg)|

- Username : xshin
- Password : xshin

To change username password edit file `~/.scripts/login.sh`.
To remove Termux Login in autostart delete on ~/.zshrc `bash ~/.scripts/login.sh`

### Colorscheme (Recommended)

  <details open>
  <summary>See</summary>

  |Ayu Dark|nekonako-djancoeg|dracula|owl4ce-dark|
  |--|--|--|--|
  |![Image](/assets/images/colorscheme/ayu.jpg)|![Image](/assets/images/colorscheme/djancoeg.jpg)|![Image](/assets/images/colorscheme/dracula.jpg)|![Image](/assets/images/colorscheme/owl4ce_dark.jpg)|

  |owl4ce-light|snazzy|xshin|
  |--|--|--|
  |![Image](/assets/images/colorscheme/owl4ce_light.jpg)|![Image](/assets/images/colorscheme/snazzy.jpg)|![Image](/assets/images/colorscheme/xshin.jpg)|

### Color Toys

  <details open>
  <summary>See</summary>

  |colortest|colortest-slim|colorbars|colorview|
  |--|--|--|--|
  |![Image](/assets/images/color-toys/colortest.jpg)|![Image](/assets/images/color-toys/colortest-slim.jpg)|![Image](/assets/images/color-toys/colorbars.jpg)|![Image](/assets/images/color-toys/colorview.jpg)|

  |bloks|panes|pipes1|pipes2|pipes2-slim|
  |--|--|--|--|--|
  |![Image](/assets/images/color-toys/bloks.jpg)|![Image](/assets/images/color-toys/panes.jpg)|![Image](/assets/images/color-toys/pipes1.jpg)|![Image](/assets/images/color-toys/pipes2.jpg)|![Image](/assets/images/color-toys/pipes2-slim.jpg)|

  </details>

### User Configuration

  <details open>
  <summary><strong>lf</strong></summary>

  - Colorscheme

  |Dark Theme|Light Theme|
  |--|--|
  |![Image](/assets/images/lf/theme/dark.jpg)|![Image](/assets/images/lf/theme/light.jpg)|


  This like ncmpcpp if you change the colorscheme terminal then lf in the color section also changes

  - PATH Config File

  To change lf configuration you can edit its config file in `~/.config/lf/lfrc` and the icon variable i save on `~/.zshrc`

  </details>

  <details open>
  <summary><strong>Ncmpcpp</strong></summary>

  > NOTE:
  > Before you run ncmpcpp you need run MPD first with `mpd`. If you doesn't run mpd first ncmpcpp will connection refused

  - Help

  |Help|
  |--|
  |![Ncmpcpp Help](/assets/images/ncmpcpp/help/help.jpg)|

  To show help press `F1`

  - Browse Mode

  |MPD Database|Local Filesystem|
  |--|--|
  |![MPD Database](/assets/images/ncmpcpp/browse/mpd-database.jpg)|![Local Filesystem](/assets/images/ncmpcpp/browse/local-filesystem.jpg)|

  To browse the music file press `2` and search your music path
  > NOTE:
  > Press `1x` to mode MPD Database. Press `2x` to mode Local Filesystem.

  - User Interface

  |Classic|Alternative|
  |--|--|
  |![Classic](/assets/images/ncmpcpp/ui/classic.jpg)|![Alternative](/assets/images/ncmpcpp/ui/alternative.jpg)|

  To change User Interface press `\`

  - Visualizer Mode

  |Wave|Wave Filled|Spectrum|Ellipse|
  |--|--|--|--|
  |![Wave](/assets/images/ncmpcpp/visualizer-mode/wave.jpg)|![Wave-Filled](/assets/images/ncmpcpp/visualizer-mode/wave-filled.jpg)|![Spectrum](/assets/images/ncmpcpp/visualizer-mode/spectrum.jpg)|![Ellipse](/assets/images/ncmpcpp/visualizer-mode/ellipse.jpg)|

  To Change Visualizer Mode press `<space>`

  - Colorscheme

  If you change the colorscheme in termux, like this
  |Change Color Scheme|
  |--|
  |![Chcolor](/assets/images/ncmpcpp/color/chcolor.jpg)|

  then ncmpcpp in the color section aslo changes

  |Nekonako-Djancoeg|Ayu Light|xShin|
  |--|--|--|
  |![Nekonako-Djancoeg](/assets/images/ncmpcpp/color/djancoeg.jpg)|![Ayu-Light](/assets/images/ncmpcpp/color/ayu-light.jpg)|![xShin](/assets/images/ncmpcpp/color/xshin.jpg)|

  - Clock

  |Clock|
  |--|
  |![Ncmpcpp Clock](/assets/images/ncmpcpp/clock/clock.jpg)|

  To use clock mode press `=` (equal) but you can't open if screen too small (you must zoom out the screen)

  - PATH Config File

  ncmpcpp configuration PATH in `~/.config/ncmpcpp/config`

  </details>

  <details open>
  <summary><strong>Cava</strong></summary>

  - Default Color

  |Cava Default Color|
  |--|
  |![Cava Default Color](/assets/images/cava/cava3.jpg)|

  - Foreground Color

  |Cava Foreground Color|Cava Foreground Color|Cava Foreground Color|
  |--|--|--|
  |![Cava Foreground Color](/assets/images/cava/color/foreground/cava1.jpg)|![Cava Foreground Color](/assets/images/cava/color/foreground/cava2.jpg)|![Cava Foreground Color](/assets/images/cava/color/foreground/cava4.jpg)|

  To change foreground colors `press f`

  - Background Color

  |Cava Background Color|Cava Background Color|Cava Background Color|
  |--|--|--|
  |![Cava Background Color](/assets/images/cava/color/background/cava1.jpg)|![Cava Background Color](/assets/images/cava/color/background/cava2.jpg)|![Cava Foreground Color](/assets/images/cava/color/background/cava3.jpg)|

  To change background colors `press b`

  > NOTE :
  > Split Terminal i'm using Tmux press `CTRL + B + "`

  </details>

  <details open>
  <summary><strong>Neofetch</strong></summary>

  |Neofetch Random Small|
  |--|
  |![Neofetch Random Small](/assets/images/neofetch/random/random.jpg)|

  > NOTE for: myTermux-v.0.4.1 pre
  
  This is because i create logic script to random neofetch distro logo small, if you do not want random change the alias on file ~/.zshrc `neo="... --randomsmall ..."`

  |Alias|
  |--|
  |![Alias Neo](/assets/images/neofetch/random/cat.jpg)|

  |Neofetch Configuration|Neofetch Script|
  |--|--|
  |![Image](/assets/images/neofetch/config/config.jpg)|![Image](/assets/images/neofetch/script/script.jpg)|

  |Neofetch Battery Charging|Neofetch Battery Discharging|Neofetch Storage|
  |--|--|--|
  |![Image](/assets/images/neofetch/script/battery-charging.jpg)|![Image](/assets/images/neofetch/script/battery-discharging.jpg)|![Image](/assets/images/neofetch/script/storage.jpg)|

  To change Neofetch configuration you can edit its config file in `~/.config/neofetch/config.conf` & `~/.config/neofetch/script.sh`

  </details>


### Troubleshooting

  <details open>
  <summary><strong>exa</strong></summary>

  - **"ls" unknown argument --icons**

  This error is because of an old version of `exa` that doesn't support `--icons` argument. To fix this please use `exa ^v.0.9.0`. <br><br>
  In my case, it is because of my old `sources.list` in `$PREFIX/etc/apt/sources.list` and it actually is packages' server or mirror. 
  On the first `pkg update`, you should answer `y` when asked whether you wanna keep your current version or switch to the package maintainer's version. Please switch it to the maintainer's version.<br><br>
  If for any reason you cannot get the right version of `exa`, there is an alternative software which do merely the same as `exa` named `lsd`. <br>
  * Run `pkg install lsd` to install. Then you need to modify `~/.zshrc` where the `alias ls="exa "` exists and replace it to `alias ls='lsd'` and maybe also `alias la='lsd -a'`.

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
  |![Image](/assets/images/troubleshooting/ncmpcpp/path.jpg)|

  </details>

  <details open>
  <summary><strong>Neofetch</strong></summary>

  - **Battery & Storage icon not showing**

  If you want Battery icon showing you have to install <strong>Termux-API</strong> app from the same source as your installed Termux (whether from PlayStore or F-Droid). Though it is recommended for you to install Termux from F-Droid <strong>Don't forget to install termux-api package on Termux with `pkg install termux-api`</strong>. <br>For storage info you must set it to the right partition on your Android (e.g `/storage/emulated`).
  > NOTE:
  > Please run `df -h` to know where your internal partition is located.

  |Termux-API|Storage|
  |--|--|
  |![Image](/assets/images/troubleshooting/neofetch/api.png)|![Image](/assets/images/troubleshooting/neofetch/partitions.png)

  </details>

  ## :hearts:  Credits / Big Thanks
  - **Inspiration**
    - [owl4ce](https://github.com/owl4ce)
    - [adi1090x](https://github.com/adi1090x)

  - **Bash Spinner UI**
    - [tlatsas](https://github.com/tlatsas/bash-spinner)

  - **Github Repository Size**
    - [yoandypv](https://github.com/yoandypv/github-repository-size)

  - **Knowledge**
    - [bandithijo](https://github.com/bandithijo)
    - [Ann](https://github.com/annzc)

  - **Other**
    - [Dotfiles Indonesia](https://t.me/dotfiles_id)
    - [Siduck76](https://github.com/siduck76)
    - [nekonako](https://github.com/nekonako)
    - [Oh-My-ZSH](https://github.com/ohmyzsh/ohmyzsh)
    - [MPD](https://wiki.archlinux.org/index.php/Music_Player_Daemon)
    - [Ncmpcpp](https://wiki.archlinux.org/index.php/ncmpcpp)
    - [Owl4ce Dotfiles](https://github.com/owl4ce/dotfiles)
    - [Neovim](https://neovim.io)
    - [Vim Plug](https://github.com/junegunn/vim-plug)
    - [Neofetch](https://github.com/dylanaraps/neofetch)
