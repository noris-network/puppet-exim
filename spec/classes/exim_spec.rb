require 'spec_helper'

describe 'exim', type: 'class' do
  let(:facts) { { osfamily: 'Debian', concat_basedir: '/dne' } }

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

  context 'ldap_default_servers' do
    let(:params) { { ldap_default_servers: ['ldap1', 'ldap2'] } }

    it { is_expected.to contain_concat__fragment('main').with_content(%r{^ldap_default_servers\s+= ldap1 : ldap2$}) }
  end

  ['acl_smtp_mail', 'acl_smtp_rcpt', 'acl_smtp_data', 'acl_smtp_mime'].each do |parameter|
    context parameter do
      let(:params) { { parameter => 'acl_check' } }

      it { is_expected.to contain_concat__fragment('acl-header').with_content(%r{^#{parameter}\s+= acl_check$}) }
    end
  end

  bool_parameter = ['message_logs', 'gnutls_compat_mode']
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

  string_parameter = ['acl_not_smtp']
  string_parameter.each do |parameter|
    context parameter + ' set to foo' do
      let(:params) { { parameter => 'foo' } }

      it { is_expected.to contain_concat__fragment('acl-header').with_content(%r{^#{parameter}\s+= foo$}) }
    end
    context parameter + ' not set' do
      it { is_expected.to contain_concat__fragment('acl-header').without_content(%r{^#{parameter}}) }
    end
  end
end
