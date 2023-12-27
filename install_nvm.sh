#!/bin/bash

# Step 1: Remove any remnants of a previous nvm installation
rm -rf ~/.nvm

# Step 2: Download the nvm installation script
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh > install_nvm.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# Step 3: Execute the installation script
bash install_nvm.sh

# Step 4: Source the nvm setup in the current terminal session
source ~/.bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Step 5: Install the latest LTS version of Node.js
nvm install --lts

# Step 6: Set the Node.js LTS version as the default
nvm use --lts

# Step 7: Verify Node.js and npm versions
node -v
npm -v

# Optional: Clean up the installation script
rm install_nvm.sh

echo "Installation completed."
