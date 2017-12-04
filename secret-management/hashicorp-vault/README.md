# Hashicorp vault 

**Tutorial Table of Contents** 
- Brief Intro
- Download and installation
- Running in dev mode
- Initialization 
- Storing secrets 
- Retrieve secrets

**What is Vault?**
- Vault is a tool for securely accessing secrets. A secret is anything that you want to tightly control access to, such as API keys, passwords, certificates, and more. Vault provides a unified interface to any secret, while providing tight access control and recording a detailed audit log.


**Linux Installation**
- If you want to use more automated script for linux reference here
- https://github.com/compscied/hashicorp-vault-tutorial/blob/master/install-vault-linux.sh


**Manual install - let's start first by downloading vault** 
- https://www.vaultproject.io/downloads.html

Unzip
- unzip vault*.zip

**Run vault**
- ./vault

You should see output
~~~~~~~
usage: vault [-version] [-help] <command> [args]

Common commands:
    delete           Delete operation on secrets in Vault
    path-help        Look up the help for a path
    read             Read data or secrets from Vault
    renew            Renew the lease of a secret
    revoke           Revoke a secret.
    server           Start a Vault server
    status           Outputs status of whether Vault is sealed and if HA mode is enabled
    unwrap           Unwrap a wrapped secret
    write            Write secrets or configuration into Vault

All other commands:
    audit-disable    Disable an audit backend
    audit-enable     Enable an audit backend
    audit-list       Lists enabled audit backends in Vault
    auth             Prints information about how to authenticate with Vault
    auth-disable     Disable an auth provider
    auth-enable      Enable a new auth provider
    capabilities     Fetch the capabilities of a token on a given path
    generate-root    Generates a new root token
    init             Initialize a new Vault server
    key-status       Provides information about the active encryption key
    list             List data or secrets in Vault
    mount            Mount a logical backend
    mount-tune       Tune mount configuration parameters
    mounts           Lists mounted backends in Vault
    policies         List the policies on the server
    policy-delete    Delete a policy from the server
    policy-write     Write a policy to the server
    rekey            Rekeys Vault to generate new unseal keys
    remount          Remount a secret backend to a new path
    rotate           Rotates the backend encryption key used to persist data
    seal             Seals the vault server
    ssh              Initiate a SSH session
    step-down        Force the Vault node to give up active duty
    token-create     Create a new auth token
    token-lookup     Display information about the specified token
    token-renew      Renew an auth token if there is an associated lease
    token-revoke     Revoke one or more auth tokens
    unmount          Unmount a secret backend
    unseal           Unseals the vault server
    version          Prints the Vault version
~~~~~~

**Next let's run vault in dev mode which will be already unsealed and in memory**
- ./vault server -dev

- Expected output:
~~~~~~~~~~
==> Vault server configuration:

                 Backend: inmem
              Listener 1: tcp (addr: "127.0.0.1:8200", cluster address: "", tls:
 "disabled")
               Log Level: info
                   Mlock: supported: false, enabled: false
                 Version: Vault v0.6.1

==> WARNING: Dev mode is enabled!

In this mode, Vault is completely in-memory and unsealed.
Vault is configured to only have a single unseal key. The root
token has already been authenticated with the CLI, so you can
immediately begin using the Vault CLI.

The only step you need to take is to set the following
environment variables:

    set VAULT_ADDR=http://127.0.0.1:8200

The unseal key and root token are reproduced below in case you
want to seal/unseal the Vault or play with authentication.

Unseal Key (hex)   : e6df8e19467b72615ee995cda791934a100008bed4795429fce4e39a9a8
cd539
Unseal Key (base64): 5t+OGUZ7cmFe6ZXNp5GTShAACL7UeVQp/OTjmpqM1Tk=
Root Token: 296d2ce0-cd86-194e-baa3-6f90a3179c67

==> Vault server started! Log data will stream in below:

2016/09/09 15:18:44.389915 [INF] core: security barrier not initialized
2016/09/09 15:18:44.393915 [INF] core: security barrier initialized shares=1 thr
eshold=1
2016/09/09 15:18:44.394915 [INF] core: post-unseal setup starting
2016/09/09 15:18:44.397916 [INF] core: successfully mounted backend type=generic
 path=secret/
2016/09/09 15:18:44.397916 [INF] core: successfully mounted backend type=cubbyho
le path=cubbyhole/
2016/09/09 15:18:44.398916 [INF] core: successfully mounted backend type=system
path=sys/
2016/09/09 15:18:44.398916 [INF] rollback: starting rollback manager
2016/09/09 15:18:44.402916 [INF] core: post-unseal setup complete
2016/09/09 15:18:44.402916 [INF] core: root token generated
2016/09/09 15:18:44.402916 [INF] core: pre-seal teardown starting
2016/09/09 15:18:44.402916 [INF] rollback: stopping rollback manager
2016/09/09 15:18:44.402916 [INF] core: pre-seal teardown complete
2016/09/09 15:18:44.403916 [INF] core: vault is unsealed
2016/09/09 15:18:44.403916 [INF] core: post-unseal setup starting
2016/09/09 15:18:44.403916 [INF] core: successfully mounted backend type=generic
 path=secret/
2016/09/09 15:18:44.403916 [INF] core: successfully mounted backend type=cubbyho
le path=cubbyhole/
2016/09/09 15:18:44.404916 [INF] core: successfully mounted backend type=system
path=sys/
2016/09/09 15:18:44.404916 [INF] rollback: starting rollback manager
2016/09/09 15:18:44.406916 [INF] core: post-unseal setup complete
~~~~~~~~~~

