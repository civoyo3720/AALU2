#!/bin/bash

# Update pip
pip install --upgrade pip

# Function to check if a package is installed
check_and_install() {
    package=$1
    if ! pip show $package > /dev/null 2>&1; then
        echo "Installing $package..."
        pip install $package
    else
        echo "$package is already installed."
    fi
}

# Read requirements.txt and install packages if not installed
while IFS= read -r package; do
    check_and_install $package
done < requirements.txt

echo "Setup complete!"
