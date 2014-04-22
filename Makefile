UPLOAD_DIR='/mnt/eric/Google_Drive/vagrant'
UPLOAD_COMMAND=ssh eric "cd Google_Drive;grive"
BOXES=$(wildcard build/*.box)


wheezy64: 
	cd packer; packer build -force wheezy64.json

clean:
	rm -rf build/
	rm -rf packer/output-virtualbox-iso

upload:
	cp $(BOXES) $(UPLOAD_DIR)
	$(UPLOAD_COMMAND)



.PHONY: clean upload
