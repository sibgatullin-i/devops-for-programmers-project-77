encrypt:
	ansible-vault encrypt terraform/secret.auto.tfvars --vault-password-file .vault-password

decrypt:
	ansible-vault decrypt terraform/secret.auto.tfvars --vault-password-file .vault-password

init:
	cd terraform && terraform init -backend-config=secret.backend.tfvars

i-migrate:
	cd terraform && terraform init -migrate-state -backend-config=secret.backend.tfvars

plan:
	cd terraform && terraform plan

apply:
	cd terraform && terraform apply

destroy:
	cd terraform && terraform destroy

show:
	cd terraform && terraform show

graph:
	cd terraform && terraform graph