install-deps:
	ansible-galaxy install -r requirements.yml

deploy:
	ansible-playbook -i inventory.ini playbook.yml

prepare:
	ansible-playbook -i inventory.ini playbook.yml --tags setup

redmine:
	ansible-playbook -i inventory.ini playbook.yml --tags redmine

# datadog:
# 	ansible-playbook -i inventory.ini playbook.yml --vault-password-file .vault-password --tags datadog
