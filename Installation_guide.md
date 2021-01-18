# Installation Guide (Windows 10)

[ [Back to README.md](https://github.com/rhjacobsen/CN_workshops/blob/master/README.md) ]

## About the setup

The workshops are prepared for the GNS3 simulator. GNS3 is open source, free software that you can download from [gns3.com](http://gns3.com). 
GNS3 is supported on Windows, Linux and MacOS. It comes with a bundled of various prerequisite and optional software such as the Wireshark protocol analyzer. To access network appliances, a terminal software such as Putty will be used. You will also need to install a [GNS3 virtual machine](https://gns3.com/software/download-vm) to run a server with a virtualized network on your computer. The VM server is available for VMWare, Virtual box and Hyper-V. Note that Hyper-V comes with Windows 10 but must be enabled. 

To successfully run the GNS3 simulator, there are some [hardware requirements](#hw_reqs) to consider. According to the GNS3 web page, the following are the minimum requirements for a Windows GNS3 environment:
- Processor: 2 or more Logical cores
- Virtualization: Virtualization extensions required. You may need to enable this via your computer's BIOS.
- Memory: 4 GB RAM
- Storage: 1GB available space.
- Additional Notes: You may need additional storage for your operating system and device images.


The nodes of the network, called appliances in the GNS3 terminology, will be built and installed in the simulation. To build these network nodes (appliances) we will make use of [Docker support in GNS3](https://docs.gns3.com/docs/emulators/docker-support-in-gns3/#!).


## Software installation steps

```
DISLAIMER: Some of the steps below might down-grade the default security settings on your system. 
We shall not be kept liable for any damages arising from the use of or inability to use your system 
after following the guided steps below.
```

1. Install GNS3 from the official [download page](https://gns3.com/software/download). You will need to register with the GNS3 community. Allow the program to also select to download the GNS3-VM. 
2. Enable Hyper-V in your system. This is done by turning on the [Hyper-V features](https://github.com/rhjacobsen/CN_workshops/blob/master/Docs/Figs/hyperv-capture.png) in Windwows. Note that Hyper-V comes with Windows 10 Professional and Windows 10 Enterprise editions. For Windows 10 Home edition you need to run a [Hyper-V installer program](https://www.itechtics.com/enable-hyper-v-windows-10-home/#:~:text=%20Enable%20Hyper-V%20in%20Windows%2010%20Home%20,see%20the%20Windows%20updates%20screen%20upon...%20More%20).  
3. Unpak the GNS3 VM in a folder from where you can install it. If you did not download the GNS3 VM in Step 1 you can find it [here](https://gns3.com/software/download-vm). 
4. Install the GNS3. Open the Windows PowerShell running it as an administrator. Navigate to the folder where you unpacked the virtual machine and run the script ``create-vm.ps1``. You should get an output like [this](https://github.com/rhjacobsen/CN_workshops/blob/master/Docs/Figs/gns3-vm-capture.png) and you GNS3 VM should be visible in the [Hyper-V Manager](https://github.com/rhjacobsen/CN_workshops/blob/master/Docs/Figs/hypervman-capture.png). Note that you might need to enable ExecutionPolicy on you machine to allow for [this](https://github.com/rhjacobsen/CN_workshops/blob/master/Docs/Figs/executionpolicy-capture.png).
5. Run GNS3. You may need to run GNS3 as administrator to get access to the GNS3 VM. Selected 'cancel' if you are asked to create a new project.
6. Go to Edit->Preferences and setup the [server](https://github.com/rhjacobsen/CN_workshops/blob/master/Docs/Figs/gns3-pref1-capture.png) to run GNS3 locally and the [virtual server](https://github.com/rhjacobsen/CN_workshops/blob/master/Docs/Figs/gns3-pref2-capture.png) to host the virtualization environment.
7. Clone the git repository for the CN workshops (or simply download files and unpack). Command: `git clone https://github.com/rhjacobsen/CN_workshops.git`.
8. In GNS3, go to File->Import appliance and select the Node, Router and QRouter from the repository: `./CN_Workshops/Appliances` abd accept to install the appliance on the GNS3 VM.

----

2. Install Docker and configure [GNS3 for Docker](https://github.com/KalleDK/docker-itifn/tree/master/workshops). ([Install Docker for Windows 10](https://docs.docker.com/docker-for-windows/install/))
3. Clone the repository
4. Pull the docker images 'docker pull kalledk/itifn'
2. Run GNS3
3. Import CN appliances Node + Router from appliance directory. This will create a template

## Useful links

- [Documentation for GNS3](https://docs.gns3.com/).
- [Git software download](https://git-scm.com/downloads).
- Alternative guide: [Install GNS3 VM on Windows 10](https://summarynetworks.com/info-tlc/installing-gns3-vm-on-hyper-v-virtualization-platform-in-windows-10/)
- [Youtube video showing how to install GNS3 VM with Hyper-V](https://www.youtube.com/watch?v=YME5I_Er-0U)
- [Enabling Hyper-V in Windows Home edition](https://www.itechtics.com/enable-hyper-v-windows-10-home/#:~:text=%20Enable%20Hyper-V%20in%20Windows%2010%20Home%20,see%20the%20Windows%20updates%20screen%20upon...%20More%20)
- [How to Enable PowerShell Scripts in Windows 10 via PowerShell Execution Policy](https://winbuzzer.com/2020/07/10/how-to-enable-powershell-scripts-in-windows-10-via-powershell-execution-policy-xcxwbt/)



## Notes 

When you create topologies in GNS3 using the software GUI client, the devices created need to be hosted and run by a server process. 
You have a few options for the server part of the software:

1. Local GNS3 server (see [Setup Wizard](https://docs.gns3.com/docs/getting-started/setup-wizard-local-server))
2. Local GNS3 VM
3. Remote GNS3 VM

(**Note:** It is recommended to install a GNS3 virtual machine (VM) in addtion to the desktop installation for better scalability and robustness. The GNS3 server also contains a vast number of preinstalled network devices.
In addtions, GNS3 hosts a large amont of compatible network appliances in the [GNS3 Market Place](https://www.gns3.com/marketplace). )

When you have installed the GNS3, I recommend that you proceed to create [your first GNS3 topology](https://docs.gns3.com/docs/getting-started/your-first-gns3-topology/#!) following the guidelines to get to know the GNS3 GUI and to see if the GNS3 is installed correctly.



