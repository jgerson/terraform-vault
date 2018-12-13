# sudo policy
resource "vault_policy" "admin_vault" {
  name = "admin_vault"

  policy = <<EOF
path "*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
EOF
}

# allow to generate database passwords
resource "vault_policy" "admin_db" {
  name = "admin_db"

  policy = <<EOF
path "database/creds/readonly" {
   capabilities = ["read"]
}
EOF
}

# allow read only access to key/value secret engine mounted at kv/
# restrict access to kv/priv/*
resource "vault_policy" "dev" {
  name = "dev"

  policy = <<EOF
path "kv/*" {
  capabilities = ["read", "list"]
}

path "kv/priv/*" {
  capabilities = ["deny"]
}
EOF
}

# allow all operations on kv/
# restrict access to kv/priv/*
resource "vault_policy" "ops" {
  name = "ops"

  policy = <<EOF
path "kv/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "kv/priv/*" {
  capabilities = ["deny"]
}
EOF
}