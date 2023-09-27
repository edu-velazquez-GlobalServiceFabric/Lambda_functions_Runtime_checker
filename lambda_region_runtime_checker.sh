#!/bin/bash
#Autor: Edu Velazquez
#Email: Eduardo.velazquez@sage.com
#Date: 19-09-2023
#Script Version: V. 00.2  
# Get the AWS account ID
account_id=$(aws sts get-caller-identity --query "Account" --output text)

# Create a directory to store the results
output_dir="lambda_results_${account_id}"
mkdir -p "$output_dir"

# Get a list of all AWS regions
regions=$(aws ec2 describe-regions --query "Regions[].RegionName" --output text)

# Flag to check if any functions with runtime nodejs14.x were found
functions_found=false

# Loop through each region and list Lambda functions with runtime nodejs14.x
for region in $regions; do
    echo "Region: $region"
    result=$(aws lambda list-functions --region "$region" --query 'Functions[?Runtime==`nodejs14.x`].FunctionName' --output text)

    if [ -n "$result" ]; then
        echo "Lambda functions with runtime nodejs14.x: has been found"
        echo "$result"
        echo "$result" > "${output_dir}/${region}.txt"
        functions_found=true
    else
        echo "No nodejs14.x Lambda functions found in the region."
    fi
    echo ""
done

# Check if any functions with runtime nodejs14.x were found
if $functions_found; then
    echo "Results saved in directory: $output_dir"
else
    echo "No nodejs14.x Lambda functions found in any region."
    rm -rf "$output_dir" # Remove the directory if no functions were found
fi