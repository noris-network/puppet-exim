require 'spec_helper'

describe 'exim::domainlist', type: 'define' do
  Puppet::Util::Log.level = :info
  Puppet::Util::Log.newdestination(:console)

  let(:pre_condition) { 'class { "exim": }' }
  let(:facts) { { concat_basedir: '/dne', osfamily: 'Debian' } }
  let(:title) { 'testdomainlist' }

  describe 'Path set' do
    let(:params) { { path: '/etc/exim/testdomainlist', domains: ['test.de'] } }

    it { is_expected.to contain_file('/etc/exim/testdomainlist').with_content(%r{test\.de}) }
  end
end
