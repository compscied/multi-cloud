# Implementation Options for Multi-Cloud Virtual Machine Registry/Catalog/Repository
# Problem: 
- We need to keep track of various virtual machine images across different cloud instance (private or public)
- Multi-Cloud Virtual Machine Registry/Catalog/Repository is useful as a catalog of VMIs that can stored on the VMI repository systems of the different Cloud Management Platforms (such as VMWare ESX or OpenStack) or on public Clouds (such as AWS, Azure, Google Cloud). Customized VMIs are indexed in VMRC and applications can query, as an example, for a VMI based on Ubuntu 16.04 LTS with Java already installed.
