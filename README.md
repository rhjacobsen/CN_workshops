#  Computer Networks Course Workshops
This repository contains materials for the workshops in the computer engineering bachelor course in Computer Networks at Aarhus University.

The workshops are made for the GNS3 simulator. GNS3 is open source, free software that you can download from [http://gns3.com](http://gns3.com). It allows the creation of virtual networks of hosts, switches and routers among other network appliances. There is a good amount of [documentation for GNS3](https://docs.gns3.com/). 

### List of workshops

- [Workshop 1](https://github.com/rhjacobsen/CN_workshops/tree/master/Workshops/1): Configuring IPv4 and IPv6
- [Workshop 2](https://github.com/rhjacobsen/CN_workshops/tree/master/Workshops/2): IPv6 transition mechanism
- [Workshop 3](https://github.com/rhjacobsen/CN_workshops/tree/master/Workshops/3): Network programming
- [Workshop 4](https://github.com/rhjacobsen/CN_workshops/tree/master/Workshops/4): Routing part 1
- [Workshop 5](https://github.com/rhjacobsen/CN_workshops/tree/master/Workshops/5): Routing part 2

### Guide for installation of the environment

[Installation guide (Windows 10)](https://github.com/rhjacobsen/CN_workshops/blob/master/Installation_guide.md)


## Delete stuff below


## Installation of the environment 

When you create network topologies in GNS3 using the software GUI client, the devices created need to be hosted and run by a server process. 

When you have installed the GNS3, I recommend that you proceed to create [your first GNS3 topology](https://docs.gns3.com/docs/getting-started/your-first-gns3-topology/#!) following the guidelines to get to know the GNS3 GUI and to see if the GNS3 is installed correctly.

## Software installation steps (for Windows)

1. Install GNS3 from [gns3.com/software/download](https://www.gns3.com/software/download)
[//]: # (2. Install Docker and configure [GNS3 for Docker](https://github.com/KalleDK/docker-itifn/tree/master/workshops). ([Install Docker for Windows 10](https://docs.docker.com/docker-for-windows/install/)))
3. Clone the repository of the workshop for the course
4. Pull the docker images 'docker pull kalledk/itifn'
2. Run GNS3
3. Import CN appliances Node and Router from appliance directory. This will create a template for your network nodes.

To successfully run the GNS3 simulator, there are some [hardware requirements](#hw_reqs) to consider. GNS3 is supported on Windows, Linux and MacOS. It comes with a bundled of various prerequisite and optional software such as the Wireshark protocol analyzer. So far I have only tested the installation on Windows 10.

# Useful links

- [Install GNS3 VM on Windows 10](https://summarynetworks.com/info-tlc/installing-gns3-vm-on-hyper-v-virtualization-platform-in-windows-10/)


# Notes

* ISSUE: To install the GNS3 VM server in GNS3, I had to run GNS3 as administrator. Even when I have the VM installed in my local directory.)
* Note: To run the workshops, we make use of [Docker support in GNS3](https://docs.gns3.com/docs/emulators/docker-support-in-gns3/#!). Note that Hyper-V and Containers Windows features must be enabled in Windows 10.
* Note: You have a few options for the server part of the software:

1. Local GNS3 server (see [Setup Wizard](https://docs.gns3.com/docs/getting-started/setup-wizard-local-server))
2. Local GNS3 VM
3. Remote GNS3 VM

(**Note:** It is recommended to install a GNS3 virtual machine (VM) in addtion to the desktop installation for better scalability and robustness. The GNS3 server also contains a vast number of preinstalled network devices.
In addtions, GNS3 hosts a large amont of compatible network appliances in the [GNS3 Market Place](https://www.gns3.com/marketplace). )


