# Initialize the local environment
terraform init \
    -backend-config="access_key=$STORAGE_ACCESS_KEY" \
    -backend-config="storage_account_name=$STORAGE_ACCOUNT_NAME" \
    -input=false 

# Select the appropriate workspace
terraform workspace select $ENVIRONMENT

# Generate a Plan for the deployment
terraform plan \
    -var environment="$ENVIRONMENT" \
    -out=$ENVIRONMENT.tfplan \
    -input=false 

# Apply the environment changes
terraform apply -input=false $ENVIRONMENT.tfplan