require 'spec_helper'

describe 'exim::config', type: 'class' do
  let(:pre_condition) { 'class{"exim":}' }

  it { is_expected.to create_class('exim::config') }
  it { is_expected.to create_exim__transport('remote_smtp') }
  it { is_expected.to create_concat__fragment('transport-remote_smtp') }
  it { is_expected.to create_exim__router('smarthost') }
  it { is_expected.to create_concat__fragment('router-smarthost') }
  it { is_expected.to create_exim__router('system_aliases') }
  it { is_expected.to create_concat__fragment('router-system_aliases') }
  it { is_expected.to create_exim__retry('*') }
  it { is_expected.to create_concat__fragment('retry-*') }
  it { is_expected.to create_exim__acl('acl_check_rcpt') }
  it { is_expected.to create_concat__fragment('acl-acl_check_rcpt') }
  it { is_expected.to create_concat('/etc/exim4/exim4.conf') }
end
