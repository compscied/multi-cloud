

Summary
-----------
The recipe installs a POC ScaleDB system using cloudify 3.2 version
The inputs are appropriate only for HP openstack

The system includes two ScaleDB Storage  nodes 
		    one Cluster  management node
		    one Mysql node



SCaleDB installation
------------------------
cfy init
cfy bootstrap --install-plugins -p cloudify-manager-blueprints-3.2/openstack/openstack-manager-blueprint.yaml -i inputs.json
scaledb/scripts/prepare.sh
cfy blueprints upload -p scaledb-openstack-blueprint.yaml -b scaledb
cfy deployments create -b scaledb -d scaledb --inputs binputs.json
cfy executions start -w install -d scaledb --timeout=2000



ScaleDB uninstall
-----------------
cfy executions start -w uninstall -d scaledb 
cfy deployments delete -d scaledb
cfy blueprints delete -b scaledb
cfy teardown -f



For further support contact info@bizkit.co.il
