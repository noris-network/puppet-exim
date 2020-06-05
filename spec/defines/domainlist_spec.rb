require 'spec_helper'

describe 'exim::domainlist', type: 'define' do
  let(:pre_condition) { 'class { "exim": }' }
  let(:title) { 'testdomainlist' }

  describe 'Path set' do
    let(:params) { { path: '/etc/exim/testdomainlist', domains: ['test.de'] } }

    it { is_expected.to contain_file('/etc/exim/testdomainlist').with_content(%r{test\.de}) }
  end
end
