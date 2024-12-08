#!/bin/bash

# Define colors
Red="\e[1;91m"
Yellow="\e[1;93m"
Blue="\e[1;94m"
White="\e[1;97m"

# Clear the screen
clear

# Display the banner using Figlet
echo -e "${Red}$(figlet -f slant "Super")"
echo -e "${Yellow}$(figlet -f slant "Scraper")"
echo -e "${White}"

# Function to scrape and download images
download_images() {
    local website="$1"
    local folder="$2"

    # Create the folder if it doesn't exist
    mkdir -p "$folder"

    echo -e "${Blue}Scraping images from $website..."
    
    # Use wget to download all images from the website
    wget -nd -r -P "$folder" -A jpg,jpeg,png,gif,webp "$website" --quiet --show-progress

    echo -e "${Yellow}Images downloaded to folder: ${White}$folder"
}

# Main script
# Prompt user for URL
echo -ne "${Red}Enter the URL of the website: ${White}"
read website

# Prompt user for folder name
echo -ne "${Yellow}Enter the folder name to save images: ${White}"
read folder_name

# Download the images
download_images "$website" "$folder_name"
