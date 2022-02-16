<h1 align="center">myTermux</h1> 

<div align="center">
  <a href="https://mytermux-xshin404.vercel.app/docs/intro" target="_blank">Install</a>
  <span> • </span>
       	<a href="https://mytermux-xshin404.vercel.app/docs/login/Username%20&%20Password" target="_blank">myTermux Login</a>
  <span> • </span>
	      <a href="https://mytermux-xshin404.vercel.app/docs/screenshot/colorscheme" target="_blank">Screenshot</a>
  <span> • </span>
	<a href="https://someonewhoknowsnothing.github.io/awesomeshot/index.html" target="_blank">Awesomeshot</a>
  <span> • </span>
      	<a href="https://xshin404.github.io/credits/index.html" target="_blank">Credits or Big Thanks</a>
  <p></p>
</div>

<div align="center">
	
[![Linux](https://img.shields.io/badge/my%20Termux-gray.svg?style=for-the-badge&logo=android)]()
	
</div>

<div align="center">
	
  <a href="https://github.com/xshin404/myTermux">
    <img src="https://img.shields.io/github/repo-size/xshin404/myTermux?style=flat-square&label=Repo" alt="GitHub repository size"/>
  </a>
  <a href="https://github.com/xshin404/myTermux/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/xshin404/myTermux?style=flat-square&logo=GNU&label=License" alt="License"/>
  </a>

  [![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.5+-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=white)](https://github.com/neovim/neovim)
  [![GitHub Issues](https://img.shields.io/github/issues/xshin404/myTermux.svg?style=flat-square&label=Issues&color=fc0330)](https://github.com/xshin404/myTermux/issues)
  [![Last Commit](https://img.shields.io/github/last-commit/xshin404/myTermux.svg?style=flat-square&label=Last%20Commit&color=58eb34)](https://github.com/xshin404/myTermux/pulse) 
          
</div>

### Installation Dependecies

> **Attention!**
> - [Termux must be **F-Droid** Version](https://f-droid.org/en/packages/com.termux/) because Termux from Playstore no longer maintained because there are some problems with the Playstore publishing
> - [Termux:API must be installed](https://f-droid.org/en/packages/com.termux.api/) myTermux use API command from Termux:API like fetch `termux-battery-status`

  <details open>
  <summary><strong>Update Repository & Upgrade Package</strong></summary>

  ```bash
    pkg update && pkg upgrade
  ```
  </details>

  <details open>
  <summary><strong>git & bc</strong></summary>

  - Package `git` for cloning or downloading repository
  - Package `bc` for calculate repository size which will be cloning or downloading

  ```bash
    pkg i -y git bc
  ```

  </details>

### Installation myTermux

  <details open>
  <summary><strong>Clone or Download This Repository</strong></summary>

  ```bash
    git clone --depth=1 https://github.com/nihsx/myTermux.git
  ```

  </details>

  <details open>
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

  ![Error](https://i.ibb.co/mDV3hd0/Screenshot-20220216-200813-Termux.png)

    > If you get error like this `Please Zoom Out`
    > Do Zoom Out of Termux Application then run again the script

  ![Running](https://i.ibb.co/w7drM8f/Screenshot-20220126-145616-Termux.png)

    > If the row and column widths of the application are correct,
    > the script will automatically run, like this:

    > Then follow the installation until it's finished

  </details>



### :camera_flash: Screenshots

<a href="https://i.ibb.co/4Vjdk89/out2.png" target="_blank" rel="noopener">
  <img alt="myTermux Colorscheme" src="https://i.ibb.co/4Vjdk89/out2.png"/>
</a>

<br />
<br />
<br />

<a href="https://i.ibb.co/bPRrbyD/final-music.png" target="_blank" rel="noopener">
  <img alt="myTermux Music" src="https://i.ibb.co/bPRrbyD/final-music.png"/>
</a>

<br />
<br />
<br />

<a href="https://i.ibb.co/6DqyPqT/final-text-editor.png" target="_blank" rel="noopener">
  <img alt="myTermux Text Editor" src="https://i.ibb.co/6DqyPqT/final-text-editor.png"/>
</a>

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
