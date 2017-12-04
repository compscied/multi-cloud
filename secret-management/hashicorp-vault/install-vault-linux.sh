#!/bin/sh
#this is still not complete

VAULT_VERSION="0.6.1"
VAULT_PATH=/opt/vault_$VAULT_VERSION
UNAME=`uname -m`
FILE_NAME=vault_$VAULT_VERSION
DOWNLOAD_PATH="https://releases.hashicorp.com/vault/$VAULT_VERSION/"

if [ "$UNAME" != "x86_64" ]; then
  PLATFORM=386
  FILE_NAME=${FILE_NAME}"_linux_386.zip"
else
  PLATFORM=amd64
  FILE_NAME=${FILE_NAME}"_linux_amd64.zip"
fi

DOWNLOAD_PATH=${DOWNLOAD_PATH}${FILE_NAME}

echo "Download will be done using URL: "$DOWNLOAD_PATH

if [ "$(id -u)" != "0" ]; then
    echo "Installation must be done under sudo"
    exit 1
fi


test -x $VAULT_PATH/vault
if [ $? -eq 0 ]; then
    echo vault seems to be already installed at $VAULT_PATH/vault
    exit 1
fi

apt-get install -y wget unzip

#rm /opt/vault_${VAULT_VERSION}_linux_${PLATFORM}.zip

wget $DOWNLOAD_PATH

mkdir -p $VAULT_PATH

unzip $FILE_NAME -d $VAULT_PATH

chmod 0755 $VAULT_PATH/vault
chown root:root $VAULT_PATH/vault

export PATH=~/opt/bin:$PATH

echo "Vault is installed at " $VAULT_PATH

echo "This should work till this point the rest is work in progress"

exit 1

echo create config

cat <<EOF >$VAULT_PATH/vault-config.hcl
backend "file" {
  path = "$VAULT_PATH/storage"
}

listener "tcp" {
  address = "127.0.0.1:8200"
  tls_disable = 1
}
EOF

echo create run script
cat <<EOF >$VAULT_PATH/vault
#!/bin/sh
if [ -z \$1 ]
then
Q  echo syntax: vault /PATH/TO/VAULT/HCL/CONFIG optional_flags
  exit 1
fi
BASEDIR=\$(dirname \$0)
cd \$BASEDIR
./vault server -config=\$1 \$2 \$3 \$4 \$5 \$6 \$7 \$8 \$9
EOF

chmod 0755 $VAULT_PATH/vault
chown root:root $VAULT_PATH/vault

echo create upstart script
cat <<EOF >/etc/init/vault.conf
description "Vault server"
start on runlevel [2345]
stop on runlevel [!2345]
respawn
script
  # Make sure to use all our CPUs, because Vault can block a scheduler thread
  export GOMAXPROCS=`nproc`
  exec $VAULT_PATH/vault ${VAULT_PATH}/vault-config.hcl >>/var/log/vault.log 2>&1
end script
EOF

service vault start
cat /var/log/vault.log
