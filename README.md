# Lambda Region Runtime Checker

The `lambda_region_runtime_checker.sh` script allows you to check AWS Lambda functions in all AWS regions to find those with a specified runtime (e.g., `nodejs14.x`). It creates individual text files for each AWS region, indicating whether Lambda functions with the specified runtime were found or not.

## Prerequisites

1. [AWS Command Line Interface (CLI)](https://aws.amazon.com/cli/)
2. AWS CLI configured with appropriate credentials.

## Usage

1. Clone this repository or download the `lambda_region_runtime_checker.sh` script to your local machine.

2. Make the script executable:

   ```bash
   chmod +x lambda_region_runtime_checker.sh
   ```
3. Run the script:
 ```bash
./lambda_region_runtime_checker.sh
```
