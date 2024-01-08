# Arch Setup for X1 Carbon Gen 9 
## System Details 
The system this setup is running on is a Thinkpad X1 Carbon Gen 9, other than the model the setup in Arch doesn't differ at all, aside from scaling and display issues across different makes and models, anything noted in the X1 Carbon Gen article on the [ArchWiki](https://wiki.archlinux.org/title/Lenovo_ThinkPad_X1_Carbon_(Gen_9)) will not be said, unless needed to be emphasized 
## Config Files
My conf files, mostly for CLI software \
*WIP* \
Currently conf files for Neovim, tmux and zsh/oh-my-zsh 
### Neovim
- Uses LSP-Zero for easy LSP setup, Mason as package manager
### Tmux
- Uses customized gruvbox tmux statusbar
- tpm as package manager (probably not necessary)
### Alacritty
- Uses old yaml config and gruvbox-dark theme, probably will migrate to toml at some point
## EFI System Partition 
ESP config: Secure Boot + EFISTUB + Unifed Kernel Image + LUKS2 
## Disk Partitions 
BTRFS:`@` for root subvolume, `@home` for home subvolume, `@.snapshots` for snapshots subvolume \
Encryption: LUKS2 with decryption key stored in TPM2, PIN to unlock TPM2 \
Swap: Swap on RAM or ZRAM used to compress items in memory as swap 
## Backup/Snapshot Management **WIP** 
snapper with automated pacman hooks to make pre and post transaction hooks to make BTRFS snapshots \
some way to export snapshots to external storage **should probably sort out in the future** could use exporting snapper 
## Problems w/ current setup 
- Kernel panic/crashing randomly (not present in lts kernel as far as I can tell) 
    - To try: use linux-lts Problem: worse performance, especially graphics on the current lts version, best performance on linux-zen 
- After running variations of this setup for a while, I foudn this problem was not necessarily a kernel panic or random crashes, I did not have enough swap (swap on zram, in my case), so the solution was to increase the zram swap size or just make a big swapfile
- intermittent wifi issues (wifi chip: Intel AX201 linux-driver: iwlwifi) 
    - To try: iwlwifi-next drivers for kernel from AUR 
## Power Management
