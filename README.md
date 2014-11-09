FussyLV
=======

Remove fussy LV's which just won't get removed!

Ever ran into a situtation like this, When the LV wasn't in use and you still got this error ? 

    [root@la02 ~]# lvremove -f /dev/vg-vm/kvm802_img
    Logical volume vg-vm/kvm802_img is used by another device.

A fix to this is either rebooting the machine the LV is on and then trying to remove the LVs, but this isn't the most ideal thing to do especially if the machine runs a bunch of virtual machines etc, hence the need for FussyLV, while FussyLV might just be a bunch of commands put into a bash script, it might be useful if you have many "stuck" LVs or just want to avoid typing a bunch of commands.

Configuration
-------------

Edit remove_lv.sh and set the name of your LV Group, like this

    VOLUME_GROUP="vg01"

Protip: If your LV Group contains a "-" between the name, like "vg-vm" then you need to enter it as "vg--vm" (ie, with -- instead of -) so it looks like:

    VOLUME_GROUP="vg--vm"
    
Usage
-------------

    sh remove_lv.sh LV_NAME_HERE

For example, my LV name is, kvm813_img

    sh remove_lv.sh kvm813_img

Which should get you the following output:
    [root@testbox ~]# sh remove_lv.sh kvm813_img
    device-mapper: remove ioctl on vg--vm-kvm813_img failed: Device or resource busy
    Command failed
    /dev/mapper/vg--vm-kvm813_img1: read failed after 0 of 512 at 41873506304: Input/output error
    /dev/mapper/vg--vm-kvm813_img1: read failed after 0 of 512 at 41873596416: Input/output error
    /dev/mapper/vg--vm-kvm813_img1: read failed after 0 of 512 at 0: Input/output error
    /dev/mapper/vg--vm-kvm813_img1: read failed after 0 of 512 at 4096: Input/output error
    /dev/mapper/vg--vm-kvm813_img1: read failed after 0 of 2048 at 0: Input/output error
    /dev/mapper/vg--vm-kvm813_img2: read failed after 0 of 4096 at 1073676288: Input/output error
    /dev/mapper/vg--vm-kvm813_img2: read failed after 0 of 4096 at 1073733632: Input/output error
    /dev/mapper/vg--vm-kvm813_img2: read failed after 0 of 4096 at 0: Input/output error
    /dev/mapper/vg--vm-kvm813_img2: read failed after 0 of 4096 at 4096: Input/output error
    Logical volume vg-vm/kvm813_img is used by another device.
    Logical volume "kvm813_img" successfully removed
    Done

