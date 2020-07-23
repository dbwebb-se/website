---
author: lew
revision:
    "2019-08-19": "(A, lew) First edition."
...
Guest Additions
=======================

Sometimes you want to copy text between your regular desktop and the virtual machine you run in VirtualBox. For that, an "addon" from the Guest Additions CD is required. The following instructions are written in the terminal inside Debian. When entering passwords in the terminal, nothing should be seen. The dollar sign should not be written, but merely indicates that it is terminal commands. Here we go!
<!-- Det är en inställning och det finns ett foruminlägg som visar "[Virtual Box och copy & paste till hostmaskinen](t/4063)". -->

```bash
# Switch to the root-user
$ su
Password: # type your chosen root password
```

Now we can install programs and necessary tools. Run the following command to install the necessary tools:

```bash
$ apt-get install build-essential module-assistant dkms
```

We prepare for building a module:

```bash
$ m-a prepare
```

We should now mount the "Guest Additions CD Image". It can get a bit messy here.

```bash
$ ls /media/cdrom
```

The above command lists what we have in the cdrom. If it is empty, we need to insert the disc. You do this via "Devices-> Insert Guest Additions CD Image ...". Try the above command again and see if files are listed. If it does, then just move on. If there is nothing there, you may need to "mount" the cdrom first:


```bash
$ mount /media/cdrom
```

Once the disc is in and files are listed, we can install Guest Additions:

```bash
# logged in as root
$ sh /media/cdrom/VBoxLinuxAdditions.run
#
# A lot of prints and some waiting time...
#
```

Reboot the VM:

```bash
$ reboot
```

When this is done, we turn off the VM and enter VirtualBox "settings". Under "General-> Advanced" we find "Shared Clipboard" and "Drag n drop". Set both of them to "Bidirectional" and restart Debian.

Here is a video when I complete the steps above:

[YOUTUBE src=PQegEbDBSOU width=630 caption="Kenneth installs Guest Additions."]

Sometimes it can be a bit of a hassle. In the video, the desktop did not want to play, but it was enough to restart Debian. Note that it is also possible to run in full screen.

Try doing this installation, it saves some time when you need to copy things.
