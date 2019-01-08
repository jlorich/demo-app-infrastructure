# Initialize the local environment
terraform init \
    -backend-config="access_key=$(storage-access-key)" \
    -backend-config="storage_account_name=$(storage-account-name)" \
    -input=false 

# Select the appropriate workspace
terraform workspace select $(environment)

# Generate a Plan for the deployment
terraform plan \
    -var environment="$(environment)" \
    -out=$(environment).tfplan \
    -input=false 

# Apply the environment changes
terraform apply -input=false $(environment).tfplan