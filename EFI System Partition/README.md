Uses `EFISTUB` as 'bootloader' to load Unified Kernel Image (due to lenovo's UEFI implementation, not taking kernel cmdline passed through `efibootmgr` \
Unified Kernel Image signed with personal self-signed keys (Microsoft/OEM PK & others cleared) generated using `openssl` \
**DO NOT STORE SECURE BOOT CERTS ON ESP** \
This completely negates the purpose of secure boot because someone can sign their binaries with your keys or modify your systems keys due to having the root cert/key \
Unified Kernel Image is generated using pacman hooks provided by `sbupdate-git` package from AUR, then signed using the same procedure \
I set my ESP_DIR to /boot/EFI, theoretically this prevents an adversary from tampering vmlinuz by keeping it within the Encrypted portion of the system by mounting ESP to /boot/EFI and keeping kernel images (vmlinuz) in /boot \
Kernel cmdline should be set in /etc/kernel/cmdline (create if not already created) before running sbupdate
