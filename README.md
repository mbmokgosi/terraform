# infra.aws.sepm

Project sets up sep instances within the cibtransitvpc account. 

## Create/updateproject

In order to create/updateproject follow the procedure bellow:

- You will need to have AWS iam access key id and secret key of *cforceops-cldfrc-tfe* user.

- Finally you can runproject creation like following **(NOTE This will apply your changes to the environment but update the project in order to plan and apply if you would like to do it manually)**:

  1. Assume ADFS SAML credentials (or any other where you can use profile to assume role in cibtransitvpc account or use any other mean)

  2. Create/update project:

    ```bash
    # obtain AWS saml token (stored in saml profile - using samlapi_formauth.py script or any other mean)
    cd in project
    # environment depends on the run of the project (so e.g. prod is for actual production release and dev is for the test release (it has nothing to do with actual environment of the account itself) -> then this environment variable which should be reflected also in the -var parameter because by default it is set to prod)

    Terraform init -backend-config 'profile=adfs_transitvpc' -backend-config "key=terraform/tvpc_team/cibtransitvpc/eu-west-1/euw1-prd-ss-vpc/sepm.tfstate"
    
    # pass access key and secret key of cforceops-cldfrc-tfe user from cforceops account
    terraform plan -var 'aws_access_key_id=AKIAJQQWL4AYHVY2G55A' -var "aws_secret_access_key=${secret_key}" 
    terraform apply -var 'aws_access_key_id=AKIAJQQWL4AYHVY2G55A' -var "aws_secret_access_key=${secret_key}"
    ```

    Commands above will create/update respective project.