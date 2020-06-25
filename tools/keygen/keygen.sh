#/bin/bash

if [ ! -d "keys/" ]; then \
	mkdir ../keys; \
fi
if [ ! -f "../keys/terraform-workshop" ]; then \
	ssh-keygen -t rsa -N "" -f ../keys/terraform-workshop; \
fi