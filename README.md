---

# Minecraft Software Installer


Minecraft Software Installer is a powerful and interactive Bash script by XreatLabs that simplifies the installation process for various Minecraft server software. It provides dynamic version selection, automatic setup, and an intuitive user interface with branding.


---

# Features

Supports Multiple Server Types:

PaperMC

PurpurMC

PocketMine-MP

Forge

Fabric

Velocity

Waterfall

BungeeCord


Dynamic Version Selection: Fetches available versions directly from official APIs.

User-Friendly Interface: Features a menu-driven interface with an ASCII logo for XreatLabs.

Automatic Setup: Creates organized directories for each server type.

Cross-Platform: Works on Linux, macOS, and any Bash-supported system.



---

# Installation

1. Clone the repository:

git clone https://github.com/Xreatlabs/mcsoftware-installer.git
cd mcsoftware-installer


2. Make the script executable:

chmod +x xreatlabs_installer.sh


3. Install dependencies:

sudo apt install curl jq -y   # For Debian/Ubuntu
sudo yum install curl jq -y   # For CentOS/RHEL
brew install curl jq          # For macOS


4. Run the script:

./xreatlabs_installer.sh




---

# Usage

1. Launch the installer:

./xreatlabs_installer.sh


2. Choose the server software you want to install from the menu.


3. Select the version/build (if applicable) or download the latest version.


4. Follow the instructions to complete the installation.




---

# Supported Minecraft Server Software


---

# Customization

The script is written in Bash and can be easily modified to suit your needs.

Add or update server software by modifying the corresponding functions in xreatlabs_installer.sh.



---

# Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository.


2. Create a new branch:

git checkout -b feature/your-feature-name


3. Commit your changes:

git commit -m "Add your message here"


4. Push your branch:

git push origin feature/your-feature-name


5. Open a pull request.




---

# License

This project is licensed under the MIT License.


---

# Issues

If you encounter any issues, please report them here.


---

# Credits

Developed and maintained by XreatLabs.


---
