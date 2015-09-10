require 'spec_helper'

describe 'exim' do

  let(:facts) { {:osfamily => 'Debian', :concat_basedir => '/dne'} }
  it { should contain_class('exim::install').that_comes_before('Class[exim::config]') }
  it { should contain_class('exim') }
end
