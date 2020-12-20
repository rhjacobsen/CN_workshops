# Install and Config guide for GNS3 with Docker

## General

 * Server Client based info
 * VMWare general recommended over VirtualBox due to pasthrough

## Pure Virtual (Supported)

* Install VMWare or VirtualBox
* Install [Lubuntu](https://help.ubuntu.com/community/Lubuntu/GetLubuntu) or your favorite distro

```
# Install keys from gns3
sudo add-apt-repository --yes --keyserver https://hkps.pool.sks-keyservers.net ppa:gns3/ppa
sudo apt-get update --yes

# Install Guest Addisions of this is VirtualBox - VMWare do something else
sudo apt-get install --yes virtualbox-guest-additions-iso
```

* Reboot

```
# Preconfigure Wireshark to allow non root to use Wireshark
sudo sh -c 'echo "wireshark-common wireshark-common/install-setuid boolean true" | debconf-set-selections'

# Install GNS3, Wireshark, Git and Docker
sudo apt-get install --yes --quiet gns3-gui git wireshark docker.io gnome-terminal
sudo usermod -aG docker $USER
sudo docker pull kalledk/itifn:router
sudo docker pull kalledk/itifn:node

# Get the appliances
cd ~/Downloads
git clone https://github.com/KalleDK/docker-itifn.git
```

* Reboot

* Run gns3
* Choose __Local Server__ and __Don't show this again__ - Next
* Uncheck all checkboxes - Finish
* Under Miscellaneous uncheck __Launch the new project dialog on startup__ - Ok
* Import the appliances in __~/Downloads/docker-itifn/appliances__
    * File -> Import Appliance
    * Choose appliance
    * Next next next finish ok

## OSX

 * Follow the GNS3 VM guide below first

 * Download install file from https://www.gns3.com/software/download

 * https://gns3.com/support/docs/quick-start-guide-for-mac-users

## Windows

 * Follow the GNS3 VM guide below first

 * Download install file from https://www.gns3.com/software/download

 * https://gns3.com/support/docs/quick-start-guide-for-windows-us

## Linux

  * If you want to use a VM use the GNS3 VM guide below

## GNS3 VM

### VMWare

 * Download [GNS3.VM.VMWare.zip](https://github.com/GNS3/gns3-gui/releases/download/v1.5.2/GNS3.VM.VMware.Workstation.1.5.2.zip)

 * In VMWare do ???

### VirtualBox

 * Download [GNS3.VM.VirtualBox.zip](https://github.com/GNS3/gns3-gui/releases/download/v1.5.2/GNS3.VM.VirtualBox.1.5.2.zip)

 * In VirtualBox: File -> Import Appliance
