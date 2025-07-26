# Installing Debian

## Flash the USB
This part is straight forward, just [download the iso](https://www.debian.org/). Depending of if you are on a Linux/BSD machine, you can run [one of these commands](https://wiki.archlinux.org/title/USB_flash_installation_medium) and if you are on Windows use Rufus.

## Running the Installer
When selecting whether to use the `Graphical Installer` or the `Installer`, I reccomend just using the `Installer` on the off chance you want to drop into a terminal and manually configure things. It makes it easier to jump back and forth between the installer and the terminal.

The only part you have to pay attention to here is setting up the LVM if you have multiple hard drives. There are two ways you can go about doing this: manually or semi-manually.

Before talking about how to set up the LVM, I'm going to display an `lsblk` output to use as a reference. I chose to put the `/home` directory in its own mount. By default, the Debian installer was providing me 30GB of space in the root directory. This is where all of the packages are installed via `apt`, `flatpak`, etc. Doing some quick searching, 30GB should be fine for most people, but since we have a bunch of real estate, I bumped it up to 50GB especially since everything in the root directory (besides `/home`) is mounted onto the root logical volume.

Note that the `nvme0n1` partition is the "primary" partition as it has the boot partitions.

```
ME                  MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda                     8:0    0 931.5G  0 disk
├─stanky--vg-root     254:0    0  47.9G  0 lvm  /
└─stanky--vg-home     254:2    0   2.7T  0 lvm  /home
nvme0n1               259:0    0   1.8T  0 disk
├─nvme0n1p1           259:1    0 513.1M  0 part /boot/efi
├─nvme0n1p2           259:2    0 488.3M  0 part /boot
└─nvme0n1p3           259:3    0   1.8T  0 part
  ├─stanky--vg-root   254:0    0  47.9G  0 lvm  /
  ├─stanky--vg-swap_1 254:1    0   976M  0 lvm  [SWAP]
  └─stanky--vg-home   254:2    0   2.7T  0 lvm  /home
```

### Semi-Manual
This method leverages the Debian's installer to create an LVM partition on a hard disk, then you manually add the other physical volumes that you create to the logical volumes to expand them how you want.

When I selected Debian to separated the `/home` directory into its own mount, it gave a default space of 30GB to the root partition, as discussed above. The second SSD (`/dev/sda`) was formatted to some DOS format, presumably because its expecting to be dual boot with Windows? Either way, the problem was that the disk had a partition `/dev/sda/sda1` that I did not want. A quick and simple way to get rid of this is just formatting the disk, so you can run something like

```sh
mkfs.ext4 /dev/sdx
```

Where `x` in this case is would be `a`[^1]. If you are not sure what disk to use, a simple `lsblk` should be sufficient most of the time. After the disk is formatted, the disk needs to be added as a physical volume that can be used by the volume group. To create add the disk as a physical volume, simply run

```sh
pvcreate /dev/sdx
```

Where `x` in this case is the disk that we partitioned earlier[^2]. To see that the physical volume was added you can run[^2]

```sh
pvs # List all of the phisycal volumes
pvdisplay # List the physical volumes with volume information
```

After verifying that the volume has been created, the physical volume needs to be added to the volume group. This is done by running[^2]

```sh
vgextend [VOLUME GROUP] /deb/sdx
```

If you don't know what the volume group name is, you can run `vgs` to display a list of the logical volumes[^2]. Analogous to `pvs`, there is also a `vgdisplay` command to display more information about the volume group. 

Lets take a quick pit stop to recap what we have done up to this point. We added a disk as a physical volume that can be added to a logical group via the `pvcreate` command. After creating the physical volume, we added it to a logical volume via the `vgextend` command. At a high level, this means we have effectively added the space of `/dev/sdx` to a volume group. Now we need to allocate the disk space to the different logical volumes so they can be used.

If you want to add an entire disk to a specific logical volume, you run the commend

```sh
lvm lvextend -l +100%FREE /dev/[VOLUME GROUP]/[LOGICAL VOLUME]
```

or if you only want to allocate a certain amount of disk space to the volume

```sh
lvm lvextend -l +10G /dev/[VOLUME GROUP]/[LOGICAL VOLUME]
```

which in the case of the example above adds 10GB of space to the logical volume[^2].  We have now successfully extended the logical volume(s). However, we now need to tell the file system about the changes we made. Luckily this is very easy to do. Simply run the following command for every logical volume that was updated[^2]:

```sh
resize2fs -p /dev/mapper/[VOLUME GROUP]-[LOGICAL VOLUME]
```

### TODO: Manual

### So You Messed Up the LVM
Best way I have found to deal with this is just to restart the entire process. List the volume groups by typing `lvs`. Find the volume group you want to delete and then execute `vgremove [VOLUME GROUP]`[^3]. If you wish to get rid of the physical olume you can also run `pvremove /dev/sdx`[^3]. I also typically format the disk to get a clean start with a `mkfs.ext4 /dev/sdx`. If that does not work, you can then wipe the disk by writing zeros to the entire thing via `cat /dev/zero > /dev/sdx`[^4].

## Post Installation
The following are some base packages that you will alway install. If you are going to be creating a desktop from the install, a separate sub-section is included for some extra things you may want to do.

Some packages to install before beginning:

- [graphics card drivers](https://wiki.debian.org/GraphicsCard)
- build-essential
- git
- python[MAJOR].[MINOR]
- sudo
- vim

### Add user to `sudo`[^5]
You can either run the command `usermod -a -G sudo user`, the log out and log in again or as root, edit `/etc/sudoers` and add the line

```
[USER] ALL=(ALL) NOPASSWD:ALL
```

after

```
# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) ALL
```

### Update the package list
For every line in `/etc/apt/sources.list` with a `deb` or `deb-src` append `contrib` and `non-free`. The coontrib is going to add everythig that is not Debian essetial, but adds a bunch of stuff useful to the user (like `wine` which we want for `Steam` for a desktop install`. The `non-free` is primary for `Steam`.

If you don't see `non-free-firmware` add that as well and check if you have the [processor microcodes](https://wiki.debian.org/Microcode) installed.

### Desktop 
Some packages that you are going to want to install are:

- dunst
- nextcloud-desktop
- picom
- pipewire-pulse
- ranger
- steam
- stow
- unclutter
- xinit
- [xorg](https://wiki.debian.org/Xorg)
- zsh

#### Nerd Fonts
To install nerd fonts from Debian easily, run the following:

```sh
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
```

Some of the fonts that I like are

- SpaceMono (Actively used)
- Mononoki
- Incosolata

[1]: https://www.cyberciti.biz/faq/linux-disk-format/
[2]: https://www.cyberciti.biz/faq/howto-add-disk-to-lvm-volume-on-linux-to-increase-size-of-pool/
[3]: https://serverfault.com/questions/987045/delete-lvm-and-anything-related-to-it
[4]: https://unix.stackexchange.com/questions/636677/filling-my-hard-drive-with-zeros
[5]: https://unix.stackexchange.com/questions/292562/adding-a-sudoer-in-debian
