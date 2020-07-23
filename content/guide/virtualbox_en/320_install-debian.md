---
author: lew
revision:
    "2019-08-19": "(A, lew) First edition."
...
Install Debian
=======================

Set up a virtual machine in VirtualBox for Debian {#init}
---------------------------------

Now we create a virtual machine in VirtualBox where we can install Debian.

[INFO]Note that I increase the size of the virtual disk. It is important that it is increased to 25-30Gb.[/INFO]

[YOUTUBE src=02EXUbLy248 width=630 caption="Kenneth creates a virtual machine (VM) in VirtualBox."]

In my case, I was able to install 64-bit OS so I chose the image called *amd64*. If I could only install 32-bit OS then I would have chosen the image for *i386*.

When you start the virtual machine, the Debian installation procedure starts because it boots from the image we added.

Remember that when you click in the window that pops up, your mouse locks into that window. To remove the lock you need to click on what is called *host key*. Standard is the `Ctrl`-key.

Now we are ready to install Debian.




Install Debian in a virtual machine {#install}
---------------------------------

The following video shows the procedure of the Debian installation. The video is trimmed so the longest waiting times are cut away.

[YOUTUBE src=g4--dWPUubY width=630 caption="Kenneth installs Debian in a virtual machine in VirtualBox."]

What you need to do is basically:

* Select your country, keyboard layout and character encoding for UTF-8.
* Choose the password for the root user and create a new user.
* Choose to install only the necessary software.
* Choose a desktop environment

When you're done, you can log in to your new Debian server with either the root user or the user that you created in the installation process. Normally you do not want to log in as the root user so select the user you created. At the end of the video, I do a "snapshot" of my installation. It is like a bookmark so should something break, I can always choose to start Debian in the saved mode.

<!-- A good tip is to move on to that [installera ssh](guide/kom-igang-med-ssh/ssh) -->
