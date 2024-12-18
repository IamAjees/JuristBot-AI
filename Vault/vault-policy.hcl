path "secret/mysql/*" {
  capabilities = ["read"]
}

path "secret/aws/*" {
  capabilities = ["read", "list"]
}
