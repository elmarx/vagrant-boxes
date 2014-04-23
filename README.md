Vagrant Boxes
=============

Yet another vagrant box build with [packer][1], currently only wheezy64.

Usage
-----

Like other vagrant boxes just

    $ vagrant init zauberpony/wheezy64

Why use this?/USPs
--------------

There are dozens of vagrant boxes on vagrantcloud.com, so why another one? And it's so easy to build your own with [packer][1], so, why should you use this one?

1. *size*: currently, the wheezy64.box file is 154MB compared to e.g. chef's debian-7.4 box with 286 MB, thats less than 54%!
2. *puppet*: puppet provider preinstalled, not self-evident for all debian boxes.
3. *apt is up-to-date*: after the very first boot, the box updates the apt indices. So, no longer 404 due to outdated package URLs when installing packages (i.e.: via puppet)
4. *simple name*: I prefer the simple name wheezy64.


[1]: http://packer.io "Packer.io"




