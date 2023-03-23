#! /bin/env bash

INSTANCE_NAME="dockercompose"

echo -e "\nCreating machine..."
docker-machine create \
	--driver amazonec2 \
	--amazonec2-region us-west-1 \
	--amazonec2-ami ami-0d221cb540e0015f4 \
	--amazonec2-instance-type t2.micro \
	--amazonec2-open-port 8080 \
"$INSTANCE_NAME"


echo -e "\nActivating machine.."
echo -e "Docker machine ip - $(docker-machine ip "$INSTANCE_NAME")"
echo -e "\nSwitch to "$INSTANCE_NAME"."
eval $(docker-machine env "$INSTANCE_NAME")
echo -e "\nDONE!."
echo -e "Docker machine ip - $(docker-machine ip "$INSTANCE_NAME")"