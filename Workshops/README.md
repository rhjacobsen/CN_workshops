# Install and Config guides

GNS3 is said to work on Windows, Linux and Mac with an number of different virtualization technologies: VmWare, Hyper-V and Virtual Box. The installation of GNS3 on Windows 10 with Hyper-V has been testend and the installation guide follows below.

- [Installation guide for Windows 10](Installation_guide.md)

# FAQ

## Can I make persistent storage of my network configurations?

In GNS3, by default, nothing will [persist](https://docs.gns3.com/docs/emulators/docker-support-in-gns3/#persistence) after reloading your project. However, it is possible to configure appliances to store configuration in specific files such as /etc/network/interfaces and /etc/hosts as well as specified directories. To access this function, right-click on the appliance in your laboratory and choose _configure_. The /etc/network/interface file is accessible under Network configuration whereas the /etc/hosts and other directories can be found on the Advanced tab.

## How can I transfer files between my host OS and the GNS3 VM?

I do not know this yet. Try to look [here](https://www.itechtics.com/share-files-between-guest-host-hyper-v/) or check out [this](https://www.youtube.com/watch?v=pQHZ3sgQNrM) video.
