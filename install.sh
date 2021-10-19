#!/usr/bin/env bash

HELPERS=(
  colors animation banner package switchcase
  dotfiles clone themes nvchad utility
  stat signal screen cursor finish
)

for HELPER in ${HELPERS[@]}; do
  source $(pwd)/helper-install/${HELPER}.sh
done

# # Done
# banner
# packages
# caseInstallPackage
# dotFiles

# # Error Array
# #caseBackupDotFiles

# # Done
# backupDotFiles
# caseInstallDotfiles

# cloneRepositories
# caseCloneRepository

# zshTheme
# caseInstallZshTheme

# NvChad
# utility

function main() {

  trap 'handleInterruptByUser "Interrupt by User"' 2

  banner

  packages
  switchCase "Install" "Packages" installPackages

  dotFiles
  backupDotFiles
  switchCase "Install" "Dotfiles" installDotFiles

  repositories
  switchCase "Clone" "Repositories" cloneRepository

  zshTheme
  switchCase "Install" "ZSH Themes" installZshTheme

  NvChad
  utility

}

screenSize main