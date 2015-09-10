require 'spec_helper'

describe 'exim::config', :type => :class do
  let(:pre_condition) { 'class{"exim":}' }
  let(:facts) { {:osfamily => 'Debian', :concat_basedir => '/dne'} }
  it { should create_class('exim::config') }
end
