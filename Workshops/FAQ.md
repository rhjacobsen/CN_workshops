# FAQ

## Can I make persistent storage of my network configurations?

In GNS3, by default, nothing will [persist](https://docs.gns3.com/docs/emulators/docker-support-in-gns3/#persistence) after reloading your project. However, it is possible to configure appliances to store configuration in specific files such as /etc/network/interfaces and /etc/hosts as well as specified directories. To access this function, right-click on the appliance in your laboratory and choose _configure_. The /etc/network/interface file is accessible under Network configuration whereas the /etc/hosts and other directories can be found on the Advanced tab.

## How can I transfer files between my host OS and the GNS3 VM?
It is possible to use SFTP to transfer files between a host environment and the GNS3 VM. In Windows 11 the terminal can be used or alternatively by using a client program such as [WinSCP](https://winscp.net/eng/download.php). 

First step is to identify the IP address of the VM. In the Hyper-V Manager, highlight the GNS3 VM and choose networking tab ([see example from Hyper-V manager](https://github.com/rhjacobsen/CN_workshops/blob/master/Docs/Figs/hyperv-networking.png)). In the example, I can log into the GNS3 VM using SSH with the user gns3 and the password gns3.

Second step is to identify the location of a specific node from GNS3. To do this select the node, right-click and choose Show in file manager  ([see example](https://github.com/rhjacobsen/CN_workshops/blob/master/Docs/Figs/locating_gns3_node.png)). The pop up window will show the directory entry for the node.
