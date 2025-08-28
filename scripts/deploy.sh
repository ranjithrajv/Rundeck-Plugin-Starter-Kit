#!/bin/bash

# Load environment variables
set -a
source .envrc
set +a

# Function to clean up temporary files and directories
cleanup() {
    rm -rf ".tmp"
    echo "Cleaned up temporary files and directories"
}

# Ensure cleanup is called on script exit
trap cleanup EXIT

# Remove existing plugin zip if it exists
if [ -f "${PLUGIN_DIR}/${PLUGIN_ZIP}" ]; then
    rm -f "${PLUGIN_DIR}/${PLUGIN_ZIP}"
    echo "Removed existing ${PLUGIN_ZIP}"
fi

# Create temporary plugin directory and copy files
TMP_PLUGIN_DIR=".tmp/${PLUGIN_NAME}"
mkdir -p "${TMP_PLUGIN_DIR}"
cp -r resources "${TMP_PLUGIN_DIR}"
cp plugin.yaml "${TMP_PLUGIN_DIR}"
cp .envrc "${TMP_PLUGIN_DIR}"
echo "Created temporary ${PLUGIN_NAME} directory and copied files"

# Create zip file
(cd .tmp && zip -r "${PLUGIN_ZIP}" "${PLUGIN_NAME}")
echo "Created ${PLUGIN_ZIP}"

# Move zip file to plugin directory
mv ".tmp/${PLUGIN_ZIP}" "${PLUGIN_DIR}/"
echo "Moved ${PLUGIN_ZIP} to ${PLUGIN_DIR}"

# Restart Docker container
sudo docker restart "${CONTAINER_NAME}"
echo "Restarted ${CONTAINER_NAME} Docker container"

echo "Plugin update process completed successfully."
echo "Note: The Docker container will take at least a minute to restart. This delay is due to Rundeck's initialization process, which includes loading plugins and setting up the environment."
echo "You can check the container's status using the 'docker ps' command. Wait until the status shows as 'healthy' before attempting to access Rundeck."
