wheezy64: 
	mkdir -p build
	cd packer; packer build -force wheezy64.json

clean:
	rm -rf build/
	rm -rf packer/output-virtualbox-iso

mrproper:
	rm -rf packer/packer_cache

.PHONY: clean mrproper
