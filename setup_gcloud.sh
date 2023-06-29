#!/bin/bash
sudo apt-get update
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-437.0.0-linux-x86_64.tar.gz

# Extract the contents of the file to any location on your file system (preferably your Home directory). To replace an existing installation, remove the existing google-cloud-sdk directory and then extract the archive to the same location.:
tar -xf google-cloud-cli-437.0.0-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh

# restart shell
exec -l $SHELL

./google-cloud-sdk/bin/gcloud init

gcloud auth login

gcloud components install gke-gcloud-auth-plugin

gke-gcloud-auth-plugin --version