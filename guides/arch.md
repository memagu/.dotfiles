# Archlinux installation

Use the [Arch Wiki Installation Guide](https://wiki.archlinux.org/title/Installation_guide) for the general procedure, substituting the steps below with these specific configurations.

## Keyboard

Keyboard layout:

- `loadkeys sv-latin1`
- `echo 'KEYMAP=sv-latin1' > /etc/vconsole.conf`

## Locale

1. `printf "en_US.UTF-8 UTF-8\nen_SE.UTF-8 UTF-8\n" >> /etc/locale.gen`
1. `locale-gen`
1. ```
   cat <<EOF > /etc/locale.conf
   LANG=en_US.UTF-8
   LC_ADDRESS=en_SE.UTF-8
   LC_COLLATE=en_SE.UTF-8
   LC_IDENTIFICATION=en_SE.UTF-8
   LC_MEASUREMENT=en_SE.UTF-8
   LC_MONETARY=en_SE.UTF-8
   LC_NAME=en_SE.UTF-8
   LC_PAPER=en_SE.UTF-8
   LC_TELEPHONE=en_SE.UTF-8
   LC_TIME=en_SE.UTF-8
   EOF
   ```

## Timezone

1. `ln -sf /usr/share/zoneinfo/Europe/Stockholm /etc/localtime`
1. `hwclock --systohc`

## Disk layout

### Partitions (`fdisk /dev/disk`):

| Mount point on the installed system | Partition                   | Partition type | Filesystem | Size       |
| ----------------------------------- | --------------------------- | -------------- | ---------- | ---------- |
| `/boot`                             | `/dev/efi_system_partition` | EFI            | FAT32      | 2 GiB      |
| `[SWAP]`                            | `/dev/swap_partition`       | Linux swap     | N/A        | 1.5 \* RAM |
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
1. **Pacstrap**: `pacstrap -K /mnt base base-devel linux linux-firmware amd-ucode grub iwctl sudo reflector networkmanager fastfetch fish zoxide git neovim openssh btrfs-progs man-db man-pages`
