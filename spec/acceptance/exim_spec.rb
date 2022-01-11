require 'spec_helper_acceptance'

describe 'module definition' do
  let(:pp) do
    <<-PUPPETCODE
     class {'exim':
       manage_service => true
     }
    PUPPETCODE
  end

  it 'applies idempotently' do
    idempotent_apply(pp)
  end

  describe service('exim4'), if: (host_inventory['facter']['os']['family'] == 'Debian') do
    it { is_expected.to be_running }
    it { is_expected.to be_enabled }
  end
  describe service('exim'), if: (host_inventory['facter']['os']['family'] != 'Debian') do
    it { is_expected.to be_running }
    it { is_expected.to be_enabled }
  end
end
