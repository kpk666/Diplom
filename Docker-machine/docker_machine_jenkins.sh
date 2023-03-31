#! /bin/env bash
# source ./set_cred_env.sh

export MACHINE_NAME="jenkins"
export SYNC_FOLDER="jenkins"
export MACHINE_USER="ubuntu"
export ROOT_DIR="your directory"

CWD="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
red="$( echo -e '\033[0;31m' )" # Red
grn="$( echo -e '\033[0;32m' )" # Green
rst="$( echo -e '\033[0m' )"    # Reset Color format

echo -e $grn"\nCreating machine..."$rst
docker-machine create \
	--driver amazonec2 \
	--amazonec2-region us-west-1 \
	--amazonec2-ami ami-0d221cb540e0015f4 \
	--amazonec2-instance-type t2.medium \
	--amazonec2-open-port 8080 \
"$MACHINE_NAME"

echo -e $grn"\nCreating sync folder..."$rst
cd "$ROOT_DIR"
docker-machine ssh "$MACHINE_NAME" mkdir "$SYNC_FOLDER"
docker-machine scp -r ./"$SYNC_FOLDER/" "$MACHINE_NAME":"/home/$MACHINE_USER/"
cd "$CWD"

echo -e $grn"\nCoping sshkey for github..."$rst
docker-machine scp ./ssh_key/id_rsa "$MACHINE_NAME":"/home/$MACHINE_USER/.ssh/id_rsa"
docker-machine ssh "$MACHINE_NAME" "chmod 400 /home/"$MACHINE_USER"/.ssh/id_rsa"

echo -e $grn"\nCoping PAT for github..."$rst
docker-machine ssh "$MACHINE_NAME" mkdir .github
docker-machine scp ./ghcr_cred/github_pat "$MACHINE_NAME":"/home/$MACHINE_USER/.github/github_pat"

echo -e $grn"\nCoping aws cred..."$rst
[ -d ./aws_cred ] || mkdir ./aws_cred
aws configure get aws_access_key_id > ./aws_cred/aws_access_key_id
aws configure get aws_secret_access_key > ./aws_cred/aws_secret_access_key
docker-machine scp -r ./aws_cred/ "$MACHINE_NAME":"/home/$MACHINE_USER/.aws_cred/"

echo -e $grn"\nCoping aws key-pair..."$rst
docker-machine scp ./keypair/Ast-key-west.pem "$MACHINE_NAME":"/home/$MACHINE_USER/Ast-key-west.pem"
docker-machine ssh "$MACHINE_NAME" "chmod 400 /home/"$MACHINE_USER"/Ast-key-west.pem"

echo -e $grn"\nActivating machine.."$rst
echo -e $grn"Docker machine ip - $(docker-machine ip "$MACHINE_NAME")"$rst
echo -e $red"Run this command to configure your shell:"$rst
echo -e $red"docker-machine use "$MACHINE_NAME""$rst