#!/bin/bash
# {{PLUGIN_NAME}} - Node Executor Script
# Author: {{AUTHOR_NAME}}
# Generated on: {{DATE}}

set -euo pipefail

# Plugin configuration variables (passed from Rundeck)
TIMEOUT=${RD_CONFIG_TIMEOUT:-30}
RETRIES=${RD_CONFIG_RETRIES:-1}
NODE_NAME=${RD_NODE_NAME:-"unknown"}
NODE_HOSTNAME=${RD_NODE_HOSTNAME:-"localhost"}

# Logging function
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [{{PLUGIN_NAME}}] $*" >&2
}

# Error handling function
handle_error() {
    local exit_code=$1
    local line_number=$2
    log "ERROR: Command failed with exit code $exit_code at line $line_number"
    exit $exit_code
}

trap 'handle_error $? $LINENO' ERR

# Main execution function
execute_command() {
    local command="$*"
    local attempt=1
    
    log "Executing on node: $NODE_NAME ($NODE_HOSTNAME)"
    log "Command: $command"
    log "Timeout: ${TIMEOUT}s, Retries: $RETRIES"
    
    while [ $attempt -le $((RETRIES + 1)) ]; do
        log "Attempt $attempt of $((RETRIES + 1))"
        
        if timeout "$TIMEOUT" bash -c "$command"; then
            log "Command executed successfully on attempt $attempt"
            return 0
        else
            local exit_code=$?
            log "Command failed on attempt $attempt with exit code $exit_code"
            
            if [ $attempt -le $RETRIES ]; then
                log "Retrying in 2 seconds..."
                sleep 2
            fi
        fi
        
        ((attempt++))
    done
    
    log "All attempts failed"
    return 1
}

# Validate required parameters
if [ $# -eq 0 ]; then
    log "ERROR: No command provided"
    echo "Usage: $0 <command>"
    exit 1
fi

# Execute the command with retry logic
execute_command "$@"