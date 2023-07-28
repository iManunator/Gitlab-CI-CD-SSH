#!/bin/bash

# Check if ssh-agent is installed, if not, install openssh
command -v ssh-agent >/dev/null || ( apk add --update openssh )

# Start ssh-agent and set environment variables for it
eval $(ssh-agent -s)

# Create .ssh directory in the home directory if it doesn't exist
mkdir -p ~/.ssh

# Set the permissions of the .ssh directory to read, write, execute for the owner only
chmod 700 ~/.ssh

# Create an empty id_rsa file with read and write permissions for the owner only
install -m 600 -D /dev/null ~/.ssh/id_rsa

# Decode the SSH_PRIVATE_KEY environment variable (which is base64 encoded), 
# and write it into the id_rsa file
echo "$SSH_PRIVATE_KEY" | base64 -d > ~/.ssh/id_rsa

# Scan the public key of the SSH_HOST and add it to the known_hosts file
# The -H option hashes all hostnames and addresses in the output
ssh-keyscan -H $SSH_HOST > ~/.ssh/known_hosts

# Set the permissions of the known_hosts file to read and write for the owner, and read for the group and others
chmod 644 ~/.ssh/known_hosts
