[![Build Status](https://circleci.com/gh/cloudify-examples/aws-resource-blueprints.svg?style=shield&circle-token=:circle-token)](https://circleci.com/gh/cloudify-examples/aws-resource-blueprints)

# aws-resource-blueprints

Very general infrastructure blueprints.

## ec2-local-blueprint.yaml

This blueprint creates these resources:

* Linux Host
* Windows Host
* Elastic IP
* Security Group
* Key Pair

You will be able to communicate with the Linux VM by SSH, and with the Windows VM through WinRM.

### Install

`cfy local init -p ec2-local-blueprint.yaml -i '
aws_access_key_id: YOUR-ACCESS-KEY-ID
aws_secret_access_key: YOUR-SECRET-ACCESS-KEY
'`

* You may want to modify the default ec2 region or AMIs.

`cfy local execute -w install --task-retries=45 --task-retry-interval=10`

### Uninstall

`cfy local execute -w uninstall --task-retries=10 --task-retry-interval=5`


## vpc-local-blueprint.yaml

This blueprint creates these resources:

* Host (linux)
* IP
* Security Group
* Key Pair
* Internet Gateway
* Subnet
* VPC

You will be able to communicate with the Linux VM by SSH.

### Install

`cfy local init -p vpc-local-blueprint.yaml -i '
aws_access_key_id: YOUR-ACCESS-KEY-ID
aws_secret_access_key: YOUR-SECRET-ACCESS-KEY
'`

* You may want to modify the default ec2 region or AMIs.

`cfy local execute -w install --task-retries=45 --task-retry-interval=10`

### Uninstall

`cfy local execute -w uninstall --task-retries=10 --task-retry-interval=5`
