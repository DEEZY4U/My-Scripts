#!/bin/bash

# Prompt user for input
read -p "Enter AWS Access Key ID: " AWS_ACCESS_KEY_ID
read -p "Enter AWS Secret Access Key: " AWS_SECRET_ACCESS_KEY
read -p "Enter AWS Session Token (leave blank if not applicable): " AWS_SESSION_TOKEN
read -p "Enter AWS Region [default: us-east-1]: " AWS_REGION
AWS_REGION=${AWS_REGION:-us-east-1}

# Export variables for current shell session
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN
export AWS_DEFAULT_REGION="$AWS_REGION"

# Confirm
echo
echo "✅ AWS credentials set for region: $AWS_REGION"
echo "   These will remain active for this shell session."
echo "   Run 'unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_DEFAULT_REGION' to clear."
