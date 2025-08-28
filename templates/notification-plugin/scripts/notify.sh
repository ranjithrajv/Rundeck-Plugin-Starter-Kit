#!/bin/bash
# {{PLUGIN_NAME}} - Notification Script
# Author: {{AUTHOR_NAME}}
# Generated on: {{DATE}}

set -euo pipefail

# Plugin configuration variables (passed from Rundeck)
WEBHOOK_URL="${RD_CONFIG_WEBHOOK_URL:-}"
CHANNEL="${RD_CONFIG_CHANNEL:-general}"
USERNAME="${RD_CONFIG_USERNAME:-Rundeck}"
ON_SUCCESS="${RD_CONFIG_ON_SUCCESS:-true}"
ON_FAILURE="${RD_CONFIG_ON_FAILURE:-true}"

# Rundeck execution context variables
JOB_NAME="${RD_JOB_NAME:-Unknown Job}"
JOB_ID="${RD_JOB_ID:-}"
EXECUTION_ID="${RD_EXECUTION_ID:-}"
JOB_URL="${RD_JOB_URL:-}"
EXECUTION_URL="${RD_EXECUTION_URL:-}"
EXECUTION_STATUS="${RD_EXECUTION_STATUS:-}"
PROJECT_NAME="${RD_JOB_PROJECT:-}"

# Logging function
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [{{PLUGIN_NAME}}] $*" >&2
}

# Validate configuration
validate_config() {
    if [ -z "$WEBHOOK_URL" ]; then
        log "ERROR: webhook_url is required"
        exit 1
    fi
    
    log "Configuration validated successfully"
}

# Determine if notification should be sent
should_notify() {
    case "$EXECUTION_STATUS" in
        "succeeded")
            [ "$ON_SUCCESS" = "true" ]
            ;;
        "failed"|"aborted"|"timedout")
            [ "$ON_FAILURE" = "true" ]
            ;;
        *)
            log "Unknown execution status: $EXECUTION_STATUS"
            false
            ;;
    esac
}

# Get status emoji and color
get_status_info() {
    case "$EXECUTION_STATUS" in
        "succeeded")
            echo "✅ SUCCESS #00ff00"
            ;;
        "failed")
            echo "❌ FAILED #ff0000"
            ;;
        "aborted")
            echo "🛑 ABORTED #ff6600"
            ;;
        "timedout")
            echo "⏰ TIMEOUT #ffaa00"
            ;;
        *)
            echo "❓ UNKNOWN #888888"
            ;;
    esac
}

# Send notification
send_notification() {
    local status_info
    status_info=$(get_status_info)
    local emoji_status="${status_info% *}"
    local color="${status_info#* }"
    
    # Create notification payload (generic webhook format)
    local payload
    payload=$(cat <<EOF
{
    "channel": "$CHANNEL",
    "username": "$USERNAME",
    "text": "$emoji_status Job Execution",
    "attachments": [
        {
            "color": "$color",
            "fields": [
                {
                    "title": "Job Name",
                    "value": "$JOB_NAME",
                    "short": true
                },
                {
                    "title": "Project",
                    "value": "$PROJECT_NAME",
                    "short": true
                },
                {
                    "title": "Status",
                    "value": "$EXECUTION_STATUS",
                    "short": true
                },
                {
                    "title": "Execution ID",
                    "value": "$EXECUTION_ID",
                    "short": true
                }
            ]
        }
    ]
}
EOF
    )
    
    log "Sending notification to: $WEBHOOK_URL"
    log "Payload: $payload"
    
    # Send HTTP POST request
    if curl -s -X POST \
        -H "Content-Type: application/json" \
        -d "$payload" \
        "$WEBHOOK_URL"; then
        log "Notification sent successfully"
    else
        log "ERROR: Failed to send notification"
        exit 1
    fi
}

# Main execution
main() {
    log "Starting {{PLUGIN_NAME}} notification"
    log "Job: $JOB_NAME (ID: $JOB_ID)"
    log "Execution: $EXECUTION_ID"
    log "Status: $EXECUTION_STATUS"
    
    validate_config
    
    if should_notify; then
        log "Notification criteria met, sending notification"
        send_notification
    else
        log "Notification criteria not met, skipping"
    fi
    
    log "Notification processing completed"
}

main