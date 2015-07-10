require 'spec_helper'

describe 'exim', :type => :class do

  let(:facts) { {:osfamily => 'Debian', :concat_basedir => '/dne'} }
  it { should create_class('exim') }
  it { should contain_class('exim::install').that_comes_before('Class[exim::config]') }
end

at_exit { RSpec::Puppet::Coverage.report! }
