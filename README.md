Vagrant Boxes
=============

Vagrant boxes built with [packer][1], and available at [vagrantcloud][2] (currently only wheezy).

Usage
-----

Like other vagrant boxes just

    $ vagrant init zauberpony/wheezy

Run ``apt-get update`` before installing any package (apt-indices have been removed to reduce size, and tend to be out-of-date due to security updates nevertheless).

Features for wheezy (Why did I built my own box, why use this box instead of others?)
--------------------------------------------------------------------------

- *size*: currently, the wheezy.box file is 148MB compared to e.g. chef's debian-7.4 box with 280 MB, that's nearly 50%
- *standard uid*: chef's debian box has uid 900 for the vagrant user. That's cumbersome when working with nfs-shares and your host's user has uid 1000 nevertheless
- *updated*: I update the base-box in a timely manner if an debian releases a new dot-version (i.e. 7.6 to 7.7)

Previous features
-----------------

Previously I had included *puppet*, but I threw it due to the following reasons:

- reduce the box-size
- meanwhile, I prefer [ansible][3] over [puppet][4]
- installing puppet with a shell-script is relatively easy

I removed the automatic ``apt-get update`` on first boot, as it was error prone, and it's easy to run this via shell-script or ansible

The previous box is still available as *wheezy64*, and tagged as *v1.2*.


[1]: http://packer.io "Packer.io, a tool for creating identical machine images for multiple platforms from a single source configuration"
[2]: https://atlas.hashicorp.com/zauberpony "My account at vagrantcloud with a list of boxes"
[3]: http://docs.ansible.com/ "Ansible"
[4]: http://puppetlabs.com/ "Puppet"
