wheezy64: 
	mkdir -p build
	cd packer; packer build -force wheezy64.json

install:
	vagrant box add -f wheezy64 build/wheezy64.box

clean:
	rm -rf build/
	rm -rf packer/output-virtualbox-iso

mrproper:
	rm -rf packer/packer_cache

.PHONY: clean mrproper wheezy64
