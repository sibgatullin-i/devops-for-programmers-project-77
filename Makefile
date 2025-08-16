encrypt:
	ansible-vault encrypt terraform/secret.tfvars --vault-password-file .vault-password

decrypt:
	ansible-vault decrypt terraform/secret.tfvars --vault-password-file .vault-password