# controller-aws-gcp-init-simple

## Requirements
* This blueprints requires you to have a preconfigured `controllers` in both IaaSs 
* AWS credentials must be present in the controller before running this deployment
* GCP credentials must be present in the controller and PATH should be stated in inputs

####To run this blueprint: 

Create and Download 'service-account' file for your account.<br>
Place the file on the controller you want to manage GCP. speficy the PATH with `gcp_auth`

Install Run: 

`cfy install blueprint.yaml -i frankfurt_controller_queue_id=cloudify.tkkZQU741s -i oregon_controller_queue_id=cloudify.tqkZAe821s gcp_auth='/home/centos/gcp.json' -vv`