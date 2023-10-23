had some issuies with installation by documentation,  couldn't get a keyring right. got the vagrant just with apt install.
then "up" command didn't work cause i didn't install VirtualBox. after that also installed linux headers. there was the real need to reboot the laptop and that didn't help. So I've made some reconfiguration with errors. Finally was forced to disable secure boot option. And it worked!
run into ssh problems when getting the machine up so discovered "--debug" option.
problems were from the wrong chossen box for ubuntu, chanched it to trusty64 and all good.
Can connect through SSH, halted and then destroyed

To be updated.