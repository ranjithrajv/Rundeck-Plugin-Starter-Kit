#!/bin/bash

# This code block is used to load environment variables from a .envrc file
# set -a: Automatically export all variables assigned after this command
set -a
# source .envrc: Read and execute the contents of the .envrc file
# This loads all variables defined in .envrc into the current shell environment
source .envrc
# set +a: Turn off automatic exporting of variables
set +a
# The combination of these commands ensures that all variables defined in .envrc
# are loaded into the environment and can be used by the rest of the script

# Create plugin directory if it doesn't exist
mkdir -p "${PWD}/${PLUGIN_DIR}"
echo "Created plugin directory: ${PWD}/${PLUGIN_DIR}"

# Check if a container with the same name already exists
if sudo docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$\"; then
    echo "Error: A container with the name '${CONTAINER_NAME}' already exists."
    echo "Please remove the existing container or choose a different name in the .envrc file."
    exit 1
fi

# Check if the specified port is already in use
if sudo lsof -i :${HOST_RUNDECK_PORT} > /dev/null; then
    echo "Error: Port ${HOST_RUNDECK_PORT} is already in use."
    echo "Please choose a different port in the .envrc file or stop the process using this port."
    exit 1
fi

# Run Docker command
sudo docker run -d \
    --name ${CONTAINER_NAME} \
    -p ${HOST_RUNDECK_PORT}:4440 \
    -v ${PWD}/${PLUGIN_DIR}:/home/rundeck/libext \
    -e RUNDECK_GRAILS_URL=${RUNDECK_URL} \
    rundeck/rundeck:${RUNDECK_VERSION}

echo "Rundeck-localdev container started successfully."
