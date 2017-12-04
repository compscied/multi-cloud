# controller-aws-gcp-init-simple

## Requirements
* This blueprints requires you to have preconfigured `controllers` in all IaaS
* AWS credentials must be present in the controller before running this deployment
* GCP credentials must be present in the controller and PATH should be stated in inputs
* Openstack credentials should be present on the controller before running this deployment

####To run this blueprint: 

##### AWS
Place your AWS credentials in `etc/boto.cfg` on the controller

##### GCP
Create and Download 'service-account' file for your account.<br>
Place the file on the controller you want to manage GCP. speficy the PATH with `gcp_auth`

##### Openstack
Place your Openstack credentials in `/root/openstack_config.json` on the controller

##Install Run: 

`cfy install blueprint.yaml -i aws=cloudify.tkkZQU741s -i gcp=cloudify.tqkZAe821s openstack=cloudify.tkkZQU741s  -vv`