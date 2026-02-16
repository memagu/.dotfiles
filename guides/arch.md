# Archlinux installation

Keyboard layout:
`loadkeys sv-latin1`

Partitions (`fdisk /dev/disk`):
| Mount point on the installed system | Partition | Partition type | Filesystem | Size |
| ------------- | ------------- | ------------------ | ------ | --- |
| `/boot` | `/dev/efi_system_partition` | EFI | FAT32 | 2 GiB |
| `[SWAP]` | `/dev/swap_partition` | Linux wap | N/A | 1.5 * RAM |
| N/A | `/dev/root_partition` | Linux | btrfs | Whatever |

Subolumes (`btrfs subvol create /mnt/subvol`):
| Mount point on the installed system | Subvolume |
| ------------- | ------------- |
| `/` | `@` | 
| `/home` | `@home` | 

Mount:
- root: `mount -o noatime,compress=zstd:1,ssd,discard=async,space_cache=v2,subvol=@ /dev/root_partition /mnt`
- home: `mount -o noatime,compress=zstd:1,ssd,discard=async,space_cache=v2,subvol=@home /dev/root_partition /mnt/home`
- efi: `mount /dev/efi_system_partition /mnt/boot/efi`

Reflector: `reflector -n 20 -c Sweden --sort rate -p http -l 200 --save /etc/pacman.d/mirrorlist`

Pacstrap: `pacstrap -K /mnt base base-devel linux linux-firmware amd-ucode grub iwctl sudo reflector networkmanager fastfetch fish git neovim openssh btrfs-progs man-db man-pages`


