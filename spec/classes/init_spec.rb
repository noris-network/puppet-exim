require 'spec_helper'

describe 'exim', type: 'class' do
  it { is_expected.to create_class('exim') }
  it { is_expected.to contain_class('exim') }
  it { is_expected.to contain_class('exim::install').that_comes_before('Class[exim::config]') }

  context 'macro set' do
    let(:params) { { macros: { CONFDIR: '/etc/exim' } } }

    it { is_expected.to contain_concat__fragment('main').with_content(%r{^CONFDIR=\/etc\/exim$}) }
  end

  context 'includes' do
    let(:params) { { includes: ['foo'] } }

    it { is_expected.to contain_concat__fragment('main').with_content(%r{^\.include foo$}) }
  end

  context 'daemon_smtp_ports' do
    let(:params) { { daemon_smtp_ports: [25, 587] } }

    it { is_expected.to contain_concat__fragment('main').with_content(%r{^daemon_smtp_ports\s+= 25 : 587$}) }
  end
  context 'tls_on_connect_ports' do
    let(:params) { { tls_on_connect_ports: [25, 587] } }

    it { is_expected.to contain_concat__fragment('main').with_content(%r{^tls_on_connect_ports\s+= 25 : 587$}) }
  end

  context 'ldap_default_servers' do
    let(:params) { { ldap_default_servers: ['ldap1', 'ldap2'] } }

    it { is_expected.to contain_concat__fragment('main').with_content(%r{^ldap_default_servers\s+= ldap1 : ldap2$}) }
  end

  bool_parameter = ['message_logs', 'gnutls_compat_mode', 'smtp_return_error_details']
  bool_parameter.each do |parameter|
    context parameter + ' set to false' do
      let(:params) { { parameter => false } }

      it { is_expected.to contain_concat__fragment('main').with_content(%r{^#{parameter}\s+= false$}) }
    end
    context parameter + ' set to true' do
      let(:params) { { parameter => true } }

      it { is_expected.to contain_concat__fragment('main').with_content(%r{^#{parameter}\s+= true$}) }
    end
    context parameter + ' not set' do
      it { is_expected.to contain_concat__fragment('main').without_content(%r{^#{parameter}}) }
    end
  end

  int_parameter = ['smtp_accept_max_nonmail', 'smtp_accept_max_per_connection']
  int_parameter.each do |parameter|
    context parameter + ' set to 47' do
      let(:params) { { parameter => 47 } }

      it { is_expected.to contain_concat__fragment('main').with_content(%r{^#{parameter}\s+= 47$}) }
    end
    context parameter + ' not set' do
      it { is_expected.to contain_concat__fragment('main').without_content(%r{^#{parameter}}) }
    end
  end
  string_parameter = ['smtp_receive_timeout']
  string_parameter.each do |parameter|
    context parameter + ' set to bar foo' do
      let(:params) { { parameter => 'foo' } }

      it { is_expected.to contain_concat__fragment('main').with_content(%r{^#{parameter}\s+= foo$}) }
    end
    context parameter + ' not set' do
      it { is_expected.to contain_concat__fragment('main').without_content(%r{^#{parameter}}) }
    end
  end
  string_parameter_setonly = ['received_header_text']
  string_parameter_setonly.each do |parameter|
    context parameter + ' set to bar foo' do
      let(:params) { { parameter => 'foo' } }

      it { is_expected.to contain_concat__fragment('main').with_content(%r{^#{parameter}\s+= foo$}) }
    end
  end
  array_string_parameter = []
  array_string_parameter.each do |parameter|
    context parameter + ' set to bar foo' do
      let(:params) { { parameter => ['foo', 'bar'] } }

      it { is_expected.to contain_concat__fragment('main').with_content(%r{^#{parameter}\s+= foo : bar$}) }
    end
    context parameter + ' not set' do
      it { is_expected.to contain_concat__fragment('main').without_content(%r{^#{parameter}}) }
    end
  end
  hide_array_string_parameter = ['mysql_servers']
  hide_array_string_parameter.each do |parameter|
    context parameter + ' set to bar foo' do
      let(:params) { { parameter => ['foo', 'bar'] } }

      it { is_expected.to contain_concat__fragment('main').with_content(%r{^hide #{parameter}\s+= foo : bar$}) }
    end
    context parameter + ' not set' do
      it { is_expected.to contain_concat__fragment('main').without_content(%r{^hide #{parameter}}) }
    end
  end
  context 'ensure_resources=true and data' do
    let(:params) { { 'ensure_resources' => true } }

    it { is_expected.to contain_exim__retry('ensureresource') }
    it { is_expected.to contain_concat__fragment('retry-ensureresource') }
  end
  context 'ensure_resources=false and data' do
    let(:params) { { 'ensure_resources' => false } }

    it { is_expected.not_to contain_exim__retry('ensureresource') }
    it { is_expected.not_to contain_concat__fragment('retry-ensureresource') }
  end
end
