# Connect EOS with Vault

## Prerequisite

A working Hashicorp Vault, that is `unseal` and with a token with the proper permissions.

## Adding the acces to Vault from the cluster in Kubernetes

1. Add the auth mode of type `kubernetes`.
2. Add the connection configuration to the new authentication mode.
3. Apply the policies and roles to vault.

``` bash
export VAULT_ADDR="https://vault.myinstance.com"
export K8S_AUTH_NAME="example-cluster" 
export KUBE_HOST="https://kubernetes.default.svc" # this may change depending on your environment.
export CA_CERT=$(kubectl get -n kube-system cm/kube-root-ca.crt -o jsonpath='{.data.ca\.crt}')

vault login

vault auth enable -path=${K8S_AUTH_NAME} kubernetes

vault write auth/${K8S_AUTH_NAME}/config \
  kubernetes_host="${KUBE_HOST}" \
  kubernetes_ca_cert="${CA_CERT}"

vault policy write read-policy-example read-policy-example.json.json                    
vault write auth/${K8S_AUTH_NAME}/role/read-role-example @read-role-example.json


```


## Deploying the Helm chart of eos-secret-store

You need to match the configuration within the `read-role-example.json` to match the configuration of the `ServiceAccount` used for the `SecretStore`.