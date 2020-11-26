--------------------------------------------------
EZArcher Cala Edition - Live Xfce Desktop 
ezarch CLI Install Scripts & Calamares Installer
--------------------------------------------------

Welcome to EZArcher

The EZArcher Cala Linux ISO is a full featured Arch Linux desktop with Xfce. The live system comes with many common desktop software packages and tools to install Arch Linux on your system. There are three installation methods, the Calamares Installer Framework and my own ezarch scripts. The Calamares installer is located in the System menu and titled EZArcher Installer. Finally, there is also the choice to use the install guides to copy and paste commands that will install Arch, the Arch Way.

The live user's /home folder has an ezarcher folder with several folders containing all the project files for the ezarcher system. The ~/ezarcher/Docs folder contains some introductory readme files and suggested steps to enhance the system. The ~/ezarcher/Guides folder has the original ezarch install guides with each step to install an Arch system from scratch. The ~/ezarcher/Scripts folder contains the ezarch.bios and ezarch.uefi install scripts to perform an menu driven Arch installation.

User password: live
Root password: toor

Have fun, stay safe. :-)


--------------------------------------
Templates to Build Your Own ISOs
--------------------------------------

EZArcher Desktop Templates
https://sourceforge.net/projects/ezarch/files/EZArcher/Templates/

The EZArcher Desktop Templates project is a simple set of files and a steps.sh script to automate the building of a live desktop Arch Linux ISO that contains the Xfce Desktop (and several other desktop templates are available), a full complement of desktop software, and includes the ezarch install scripts in the ~/ezarcher/Scripts folder. I must express my sincere gratitude and give full credit to Matias Calabrese for his exemplary contribution of transforming the ezarcher templates to work with the new archiso program and process. This project would not be where it is today without his assistance and contributions. Thank you, Matias! :-)

The steps.sh file copies the necessary files into the archiso build folder, in this case, "releng" and runs the mkarchiso script to produce the EZArcher GUI ISO image. In addition to the standard Arch Linux install media packages, I have added the Xfce Desktop, a plethora of multimedia software, system maintenance and recovery tools, filesystem drivers, wifi drivers, and other assorted software in order to provide a full-featured desktop experience. The script creates a live user and assigns the password "live." The root user is given the password "toor" (root spelled backwards). Sudo is enabled, lightdm is enabled, networkmanager and systemd-resolved are enabled, and the graphical runlevel target is set.

I have included the ezarch.bios and ezarch.uefi install scripts for you to install a fresh Arch Linux system using my preferred install method. The install scripts are located in the ~/ezarcher/Scripts folder and can be launched with sudo or by using su to get a root terminal. In order to run the release versions of the ezarch install scripts, open a terminal in the ~/ezarcher/Scripts and type: sudo ./ezarch.bios or sudo ./ezarch.uefi depending on the type of installation required. The ezmaint script has nine various maintenance functions that should be performed occasionally on any Arch based system. The menu gives easy access to these functions:

-------------------------------------
 EZArcher Maintenance Script
-------------------------------------

  1) Failed systemd services
  2) Check journal logs
  3) Cleanup journal space
  4) Run system update
  5) Clean package cache
  6) Check for orphan packages
  7) Remove orphan packages
  8) Cleanup user cache folder
  9) Regenerate mirrorlist

  X) Exit

Enter your choice: 

Being based on Arch Linux, EZArcher Desktop Templates inherits the same rolling release nature and caveats. There may be times when the Arch repositories change and the installer scripts do not function as intended. If this should happen, please use the ezarcher script to download the current version of the ezarch installer script you wish to use. 

All of my scripts and documents are free for public use and adaptation. Please use and enjoy. Thank you. :-)

Revision 2020.11.15
by eznix (https://sourceforge.net/projects/ezarch/)
(GNU/General Public License version 3.0)
