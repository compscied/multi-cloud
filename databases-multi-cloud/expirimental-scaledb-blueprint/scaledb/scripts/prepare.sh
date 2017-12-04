#!/bin/bash

prog=$0
path=${prog%prepare.sh}
sfile=${path}/start.tmp
efile=${path}/start.sh
key=$HOME/.ssh/agent.pem
cp ${sfile} ${efile}
cat ${key} >> ${efile}
echo 'EOF' >> ${efile}
echo 'echo "${KEY}" > /root/cloud.key' >> ${efile}
echo 'chmod 400 /root/cloud.key' >> ${efile}
echo 'perl iscaledb -install_all -cloudify' >> ${efile}
echo 'nohup perl iscaledb -install_all & 2>&1 </dev/null' >> ${efile}
echo 'exit 0' >> ${efile}
chmod 755 ${efile}
