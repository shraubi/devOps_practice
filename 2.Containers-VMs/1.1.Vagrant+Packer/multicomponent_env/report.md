made dynamic vagrantfile for multiple machines
forgot "-y" flag in scripts
now each command needs to know to which machine it should be applied to
vagrant ssh vm1 -> ifconfig -> get ip -> vagrant ssh vm2 -> ping 192.168.56.3

To be updated.