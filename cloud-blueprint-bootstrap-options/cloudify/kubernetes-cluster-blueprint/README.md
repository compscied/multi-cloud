[![Build Status](https://circleci.com/gh/cloudify-examples/kubernetes-cluster-blueprint.svg?style=shield&circle-token=:circle-token)](https://circleci.com/gh/cloudify-examples/kubernetes-cluster-blueprint)

## Kubernetes-Cluster-Blueprint

This repository contains the required components to deploy a Kubernetes cluster with a Cloudify Manager.

Limitations (as of 22/6/2016):
+ Kubernetes Master & Nodes will only run on Ubuntu 14.04
+ Tested on Openstack Kilo (More coming soon!)
+ Tested on Cloudify 3.3.1 and 3.4
+ Tested on AWS

### Installation Instructions

Ubuntu Image description: 4 GB RAM 2 CPU 40 GB Disk

1. Create an inputs.yaml file with the inputs defined in the kubernetes-blueprint.yaml file and the other imports. See the example-inputs.yaml.
2. Upload the blueprint to your Cloudify Manager: `cfy blueprints upload -p kubernetes-blueprint.yaml -b kubernetes`
2. Create a deployment: `cfy deployments create -b kubernetes -d kubernetes -i inputs.yaml`
3. Run the install workflow: `cfy executions start -w install -d kc`


### What this blueprint covers

This blueprint follows [these instructions](http://kubernetes.io/docs/getting-started-guides/docker-multinode/master/) from Kubernetes documentation.

It follows this process:

#### Setup

Each blueprint file creates the necessary infrastructure for the IaaS you are working with. See the specific blueprint yaml file for more info.

#### Kubernetes Master Installation

1. Installs Docker if Docker is not already installed. It determines if Docker is installed by running `docker ps` on the machine. Note that it does not run sudo, so the agent user is expected to be in the docker group and not require sudo permissions.
2. Sets up the Docker Bootstrap socket.
3. Runs the ETCD container.
4. Runs Flannel.
5. Start the Kubernetes master.
6. Creates a kube-system namespace in Kubernetes.
7. Sets up Kubernetes DNS.
8. Installs the Kubernetes Dashboard.

#### Kubernetes Node Installation

1. Installs Docker if Docker is not already installed. It determines if Docker is installed by running `docker ps` on the machine. Note that it does not run sudo, so the agent user is expected to be in the docker group and not require sudo permissions.
2. Sets up the Docker Bootstrap socket.
3. Runs Flannel.
4. Starts the Kubernetes node.
5. Checks that the node has been added to the master's list of nodes.

#### Sanity

Once both the Master and the nodes are up and running, a test application (NGNIX) is started in kubernetes, and we check that it works.

#### Scaling and Healing

This blueprint defines monitoring based on the amount of CPU used by the hyperkube process on the nodes.

Scaling up is initiated when CPU Percent used by hyperkube on a single node is above 3% for more than 10 consecutive seconds. This scale policy will not exceed 6 instances.

Scaling down is initiated when CPU Percent used by hyperkube on a single node is below 1% for more than 200 consecutive seconds. This scale policy will not go below 2 instances.

Healing is initiated on a VM when no CPU metrics are being received by the manager.

#### Multicloud

By default this blueprint is configured to deploy in AWS. You can switch that to Openstack by toggling the imports.

If you want to have a manager in one IaaS and combine nodes in Openstack or AWS or both, use the imports in the respective IaaS's 'blueprint.yaml'.

Note that you need to have a VPN between your Openstack and AWS networks. Also, right now, this is a little experimental and the nodes in the remote cloud may not always configure correctly.
