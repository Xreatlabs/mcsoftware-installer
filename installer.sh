#!/bin/bash

clear 
# Function to display the XreatLabs logo
display_logo() {
    clear
    echo "=============================================="
    echo "   __   __  _______  _______  _______         "
    echo "  |  | |  ||       ||       ||       |        "
    echo "  |  |_|  ||   _   ||_     _||    ___|        "
    echo "  |       ||  | |  |  |   |  |   |___         "
    echo "  |       ||  |_|  |  |   |  |    ___|        "
    echo "  |   _   ||       |  |   |  |   |___         "
    echo "  |__| |__||_______|  |___|  |_______|        "
    echo "                                              "
    echo "      Minecraft Server Installer Tool         "
    echo "            Powered by XreatLabs              "
    echo "=============================================="
}

# Function to display the menu
show_menu() {
    display_logo
    echo "Choose a Minecraft Server Software to Install:"
    echo "1. Paper"
    echo "2. Purpur"
    echo "3. PocketMine-MP"
    echo "4. Forge"
    echo "5. Fabric"
    echo "6. Velocity"
    echo "7. Waterfall"
    echo "8. BungeeCord"
    echo "9. Exit"
    echo "=============================================="
    read -p "Enter your choice [1-9]: " choice
}

# Function to fetch available versions
fetch_versions() {
    local url=$1
    curl -s "$url" | jq -r '.[]' | sort -V
}

# Function to download a file
download_file() {
    local url=$1
    local output=$2
    echo "Downloading from: $url"
    curl -o "$output" -L "$url" --progress-bar
}

# Function to install Paper
install_paper() {
    display_logo
    echo "Fetching available Paper versions..."
    versions=$(fetch_versions "https://api.papermc.io/v2/projects/paper/versions")
    echo "Available versions:"
    echo "$versions"
    read -p "Enter the version to install: " version
    read -p "Enter build number (or 'latest' for the latest build): " build
    build=${build:-latest}
    mkdir -p Paper
    cd Paper
    download_file "https://api.papermc.io/v2/projects/paper/versions/$version/builds/$build/downloads/paper-$version-$build.jar" "paper-$version-$build.jar"
    echo "Paper $version build $build installed successfully."
    cd ..
    read -p "Press Enter to return to the main menu..."
}

# Function to install Purpur
install_purpur() {
    display_logo
    echo "Fetching available Purpur versions..."
    versions=$(fetch_versions "https://api.purpurmc.org/v2/purpur")
    echo "Available versions:"
    echo "$versions"
    read -p "Enter the version to install: " version
    read -p "Enter build number (or 'latest' for the latest build): " build
    build=${build:-latest}
    mkdir -p Purpur
    cd Purpur
    download_file "https://api.purpurmc.org/v2/purpur/$version/$build/download" "purpur-$version-$build.jar"
    echo "Purpur $version build $build installed successfully."
    cd ..
    read -p "Press Enter to return to the main menu..."
}

# Function to install PocketMine-MP
install_pocketmine() {
    display_logo
    echo "Installing PocketMine-MP..."
    mkdir -p PocketMine-MP
    cd PocketMine-MP
    download_file "https://github.com/pmmp/PocketMine-MP/releases/latest/download/PocketMine-MP.phar" "PocketMine-MP.phar"
    echo "PocketMine-MP installed successfully."
    echo "To start the server, run: php PocketMine-MP.phar"
    cd ..
    read -p "Press Enter to return to the main menu..."
}

# Function to install Forge
install_forge() {
    display_logo
    echo "Installing Forge..."
    read -p "Enter the Minecraft version for Forge (e.g., 1.20.1): " version
    mkdir -p Forge
    cd Forge
    download_file "https://maven.minecraftforge.net/net/minecraftforge/forge/$version/forge-$version-installer.jar" "forge-$version-installer.jar"
    echo "Forge $version installer downloaded successfully."
    cd ..
    read -p "Press Enter to return to the main menu..."
}

# Function to install Fabric
install_fabric() {
    display_logo
    echo "Installing Fabric..."
    mkdir -p Fabric
    cd Fabric
    download_file "https://meta.fabricmc.net/v2/versions/loader/installer" "fabric-installer.jar"
    echo "Fabric installer downloaded successfully."
    cd ..
    read -p "Press Enter to return to the main menu..."
}

# Function to install Velocity
install_velocity() {
    display_logo
    echo "Installing Velocity..."
    mkdir -p Velocity
    cd Velocity
    download_file "https://versions.velocitypowered.com/download/latest" "velocity.jar"
    echo "Velocity installed successfully."
    cd ..
    read -p "Press Enter to return to the main menu..."
}

# Function to install Waterfall
install_waterfall() {
    display_logo
    echo "Installing Waterfall..."
    mkdir -p Waterfall
    cd Waterfall
    download_file "https://api.papermc.io/v2/projects/waterfall/versions/latest/builds/latest/downloads/waterfall-latest.jar" "waterfall-latest.jar"
    echo "Waterfall installed successfully."
    cd ..
    read -p "Press Enter to return to the main menu..."
}

# Function to install BungeeCord
install_bungee() {
    display_logo
    echo "Installing BungeeCord..."
    mkdir -p BungeeCord
    cd BungeeCord
    download_file "https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar" "BungeeCord.jar"
    echo "BungeeCord installed successfully."
    cd ..
    read -p "Press Enter to return to the main menu..."
}

# Main menu loop
while true; do
    show_menu
    case $choice in
        1) install_paper ;;
        2) install_purpur ;;
        3) install_pocketmine ;;
        4) install_forge ;;
        5) install_fabric ;;
        6) install_velocity ;;
        7) install_waterfall ;;
        8) install_bungee ;;
        9) echo "Thank you for using XreatLabs Installer!"; exit ;;
        *) echo "Invalid choice. Please try again."; sleep 2 ;;
    esac
done
