# Install and Config guides

[Installation guide for Windows 10](Installation_guide.md)

## FAQ

### Can I make persistent storage of my network configurations

In GNS3, by default, nothing will [persist](https://docs.gns3.com/docs/emulators/docker-support-in-gns3/#persistence) after reloading your project unless your Docker Container is configured to do so. Your Docker Container may not be configured to have persistent data. This means if you exit GNS3 or restart your GNS3 VM your configuration will be lost. Also if you stop and restart an appliance the configuration will not persist in the memory of that particular appliance. 

Fortunately, in the latter case you can store your [networking](https://docs.gns3.com/docs/emulators/docker-support-in-gns3/#networking) configuration in scripts. For instance the /etc/network/interfaces config file contains interface configurations. See 
