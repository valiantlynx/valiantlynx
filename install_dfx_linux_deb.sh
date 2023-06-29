#!/bin/bash
# download dfx
DFX_VERSION=0.9.3 sh -ci "$(curl -fsSL https://sdk.dfinity.org/install.sh)"
 
# Copy the installation path you got from the last step and replace <REPLACE WITH YOUR INSTALLATION PATH> from the command below (You can use Notepad for this): export PATH=$PATH:<REPLACE WITH YOUR INSTALLATION PATH>
export PATH=$PATH:/home/valiantlynx/bin
export PATH=$PATH:/home/valiantlynx/bin/dfx

# Check that it has been added by running
echo "${PATH//:/$'\n'}"

# Check that dfx has been successfully installed with the following command:
dfx --version