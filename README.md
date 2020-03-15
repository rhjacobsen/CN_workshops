# Workshops in Computer networks
This repository contains materials for the workshops in the bachelor course in computer networks at Aarhus University.

The workshops are made for the GNS3 simulator. GNS3 is open source, free software that you can download from [http://gns3.com](http://gns3.com)

To successfully run the GNS3 simulator, there are some (hardware requirements)(#hw_reqs) to consider. GNS3 is supported on Windows, Linux and MacOS. It comes with a bundled of various prerequisite and optional software such as the Wireshark protocol analyzer.

There is a good about of [documentation for GNS3]([https://docs.gns3.com/). It is recommended to install a GNS3 virtual machine (VM) in addtion to the desktop installation for better scaleabiity and robustness. The GNS3 server also contains a vast number of preinstalled network devices.
In addtions, GNS3 hosts a large amont of compatible network appliances in the [GNS3 Market Place}(https://www.gns3.com/marketplace).

When you have installed the GNS3, I recommend that you proceed to create [your first GNS3 topology](https://docs.gns3.com/1wr2j2jEfX6ihyzpXzC23wQ8ymHzID4K3Hn99-qqshfg/index.html) following the guidelines of David Bombal to get to know the GNS3 GUI and to see if the GNS3 is installed correctly.

<a name="hw_reqs"></a>
## Minimum hardware requirements

According to the GNS3 web page, the following are the minimum requirements for a Windows GNS3 environment:
- Processor: 2 or more Logical cores
- Virtualization: Virtualization extensions required. You may need to enable this via your computer's BIOS.
- Memory: 4 GB RAM
- Storage: 1GB available space.
- Additional Notes: You may need additional storage for your operating system and device images.

## Software installation
Plan: Running GNS3 with a local server (VM image recommended in Windows)

Steps: 
- Downloading and installing GNS3 
- I need to install https://www.vmware.com/support/developer/vix-api/. I am installing SDK 1.15.0 - need to run on top of VMware Fusion, VMware Workstation Pro, and VMware Player. I have an old VMWare Workstation 15 Player installed on my machine. 
- Download the GNS3 VM  [https://www.gns3.com/software/download-vm](https://www.gns3.com/software/download-vm)

Note that some VMWare components cannot be installed on a system that has Microsoft HyperV installed. 

The software stack looks like this:
```
+----------------+
|      GNS3      |
+----------------+
|     VIX API    |
+----------------+
|     VMware     |
+----------------+
|     Windows    |
+----------------+
```

Hyper V info
'[microsoft](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/about/)

###
[GNS3 appliance market](https://www.gns3.com/marketplace/appliances)

## FAQ

### Cannot install VMWare on a system that has Microsoft HyperV installed
Microsoft's hypervisor HyperV comes with Windows 10. To disable/remove HyperV go to "Turn Windows features on or off"

See also [How to Delete Hyper-V Virtual Machine in Windows 10](https://www.tenforums.com/tutorials/128821-delete-hyper-v-virtual-machine-windows-10-a.html)

### How do I create and configure a Hyper-V virtual machine

Take a look at this [tutorial](https://www.youtube.com/watch?v=wfG4oFI5FIk) to see how to configure a Hyper-V virtual machine for Windows 10.

### Fix for Error "VMware Workstation and Device/Credential Guard are not compatible Fix"

See this [video](https://www.youtube.com/watch?v=VIBdY-5zr58)

See also [https://docs.microsoft.com/en-us/windows/security/identity-protection/credential-guard/credential-guard-manage](https://docs.microsoft.com/en-us/windows/security/identity-protection/credential-guard/credential-guard-manage)

See also [Solved: Device/Credential Guard error on Windows 10 Home](https://communities.vmware.com/thread/584231)
