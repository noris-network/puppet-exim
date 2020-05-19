require 'spec_helper'

describe 'exim::config', type: 'class' do
  let(:pre_condition) { 'class{"exim":}' }
  let(:facts) { { osfamily: 'Debian', concat_basedir: '/dne' } }

  it { is_expected.to create_class('exim::config') }
end
