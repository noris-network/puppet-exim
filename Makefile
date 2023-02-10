all: test_unit provision fix_secure_path install_agent install_module acceptance tear_down

test_unit:
	pdk test unit

provision:
	pdk bundle exec rake 'litmus:provision_list[docker]'

fix_secure_path: provision
	pdk bundle exec bolt --modulepath spec/fixtures/modules/ task run provision::fix_secure_path path=/opt/puppetlabs/bin -i spec/fixtures/litmus_inventory.yaml --targets all

install_agent: fix_secure_path
	pdk bundle exec rake 'litmus:install_agent'

install_module: install_agent
	pdk bundle exec rake 'litmus:install_module'

acceptance: install_agent install_module
	pdk bundle exec rake 'litmus:acceptance:parallel'

tear_down:
	pdk bundle exec rake 'litmus:tear_down'

release:
	pdk release --forge-token="$(PDK_FORGE_TOKEN)"
