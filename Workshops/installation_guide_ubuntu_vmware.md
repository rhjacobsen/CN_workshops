# Installation guide for Ubuntu 20.04 with VMWare
Installation of GNS3 following [this](https://docs.gns3.com/docs/getting-started/installation/linux) guide.


- Installation of VMWare Workstation Player from this guide. After a restart vmon and vmrun tool were compiled and added to the Linux kernel.
- (Including tools VIX: https://customerconnect.vmware.com/downloads/details?downloadGroup=PLAYER-1400-VIX1170&productId=687)
- download of image: https://github.com/GNS3/gns3-gui/releases/download/v2.2.45/GNS3.VM.VMware.Workstation.2.2.45.zip. The installation failed initially but [this](https://communities.vmware.com/t5/VMware-Workstation-Pro/Problem-installing-VMware-VIX-1-17-0/td-p/1847111) trick worked:
- ```
  sudo mv /usr/lib/vmware-installer /usr/lib/vmware-installer_OFF
  ```
  
- Setting up VM Ware (s://docs.gns3.com/docs/getting-started/setup-wizard-gns3-vm)s://docs.gns3.com/docs/getting-started/setup-wizard-gns3-vm


## References
1. [https://itdeepdive.com/2020/04/install-and-configure-gns3-with-vmware-workstation-player-free/](https://itdeepdive.com/2020/04/install-and-configure-gns3-with-vmware-workstation-player-free/)
2. [GNS3 Setup wizard with the GNS3 VM](https://docs.gns3.com/docs/getting-started/setup-wizard-gns3-vm/)
