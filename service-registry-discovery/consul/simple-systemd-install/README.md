
# Simple Consul Installer #


An auto-installer of Hashicorp Consul by [Hashi Corp](https://www.consul.io) as a service in linux systems

# Consul has the following features #
- Service Discovery: 
Consul makes it simple for services to register themselves and to discover other services via a DNS or HTTP interface. Register external services such as SaaS providers as well.
- Multi Datacenter: 
Consul scales to multiple datacenters out of the box with no complicated configuration. Look up services in other datacenters, or keep the request local.
- Failure Detection: 
Pairing service discovery with health checking prevents routing requests to unhealthy hosts and enables services to easily provide circuit breakers.
- Key Value Storage: 
Flexible key/value store for dynamic configuration, feature flagging, coordination, leader election and more. Long poll for near-instant notification of configuration changes.

## Install ##

Currently only systemd is supported

First [download consul](https://www.consul.io/downloads.html).

```
$ git clone this repository
$ cd consul-installer
$ ./systemdInstaller.sh /path/to/downloaded/consul.zip
```


## Install outcome ##


Start

`$ systemctl start consul.service`

Stop

`$ systemctl stop consul.service`

Check status

`$ systemctl status consul.service`


Install Directories

The consul binary is installed into
`/usr/local/bin/consul`

A systemd service unit file is created at
`/etc/systemd/system/consul.service`

## Uninstall ##

`$ cd /path/to/consul-installer`

`$ ./systemdUninstaller.sh`


## Configure a dependent systemd service ##

If your service depends on consul, in the service’s unit file add the following lines:


```
[Unit]

...

After=consul.service

Requires=consul.service

...
```

