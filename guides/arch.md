# Archlinux installation

Use the [Arch Wiki Installation Guide](https://wiki.archlinux.org/title/Installation_guide) for the general procedure, substituting the steps below with these specific configurations.

## Keyboard

Keyboard layout:

- `loadkeys sv-latin1`
- `echo 'KEYMAP=sv-latin1' > /etc/vconsole.conf`

## Locale

1. `echo 'en_DK.UTF-8 UTF-8' >> /etc/locale.gen`
1. `locale-gen`
1. `echo 'LANG=en_DK.UTF-8' > /etc/locale.conf`

## Timezone

1. `ln -sf /usr/share/zoneinfo/Europe/Stockholm /etc/localtime`
1. `hwclock --systohc`

## Disk layout

### Partitions (`fdisk /dev/disk`):

| Mount point on the installed system | Partition                   | Partition type | Filesystem | Size       |
| ----------------------------------- | --------------------------- | -------------- | ---------- | ---------- |
| `/boot`                             | `/dev/efi_system_partition` | EFI            | FAT32      | 2 GiB      |
| `[SWAP]`                            | `/dev/swap_partition`       | Linux wap      | N/A        | 1.5 \* RAM |
| N/A                                 | `/dev/root_partition`       | Linux          | btrfs      | Whatever   |

### Subolumes (`btrfs subvol create /mnt/subvol`):

| Mount point on the installed system | Subvolume |
| ----------------------------------- | --------- |
| `/`                                 | `@`       |
| `/home`                             | `@home`   |

### Mountpoints:

- **root**: `mount -o noatime,compress=zstd:1,ssd,discard=async,space_cache=v2,subvol=@ /dev/root_partition /mnt`
- **home**: `mount -o noatime,compress=zstd:1,ssd,discard=async,space_cache=v2,subvol=@home /dev/root_partition /mnt/home`
- **efi**: `mount /dev/efi_system_partition /mnt/boot/efi`

## System Bootstrap

1. **Mirrors**: `reflector -n 20 -c Sweden --sort rate -p http -l 200 --save /etc/pacman.d/mirrorlist`
1. **Keyring**: `pacman -Sy archlinux-keyring`
1. **Pacstrap**: `pacstrap -K /mnt base base-devel linux linux-firmware amd-ucode grub iwctl sudo reflector networkmanager fastfetch fish git neovim openssh btrfs-progs man-db man-pages`
