
provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://public_ip:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"
    method = "approle"

    parameters = {
      role_id   = ""  
      secret_id = ""
    }
  }
}

data "vault_kv_secret_v2" "example_vault" {
  mount   = "secret"
  name    = "test-secret"
}

resource "aws_instance" "CS_Lab" {
  ami           = ""
  instance_type = "t2.micro"
 
  tags = {
    Name   = "vault-instance"
    Secret = data.vault_kv_secret_v2.example_vault.data["username"]
  }
}