#!/bin/bash

# Prompt for user input
read -p "Enter plugin name: " name
read -p "Enter plugin description: " description
read -p "Enter author name: " author
read -p "Enter plugin URL: " url

# Get current date in YYYY-MM-DD format
date=$(date +%F)

# Create plugin.yaml content
cat <<EOL > plugin.yaml
name: $name
version: 0.0.1
description: "$description"
rundeckPluginVersion: 1.2
author: $author
date: $date
url: $url
providers:
    - service: UI
      name: $name
      plugin-type: ui
      title: "$name"
      description: "$description"
      ui:
        - pages: 'menu/jobs'
          scripts:
            - js/main.js
          styles:
            - css/main.css
EOL

echo "plugin.yaml created successfully."
