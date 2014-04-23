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

Minor features
--------------

Not as important, but some nice treats (at least for me).

1. *simple name*: I prefer the simple name wheezy64
2. *standard uid*: by default, debian's user ids start with 1000, but the [most popular debian box by opscode][2] sets 900 for vagrant. This brings some odd situations when dealing with nfs (yeah, could be fixed of course, but getting the uid right from the start simplifies things)



[1]: http://packer.io "packer.io, a tool for creating identical machine images for multiple platforms from a single source configuration"
[2]: https://vagrantcloud.com/chef/debian-7.4 "chef/debian-7.4"




