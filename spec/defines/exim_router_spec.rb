require 'spec_helper'

describe 'exim::router', :type => :define do

  Puppet::Util::Log.level = :info
  Puppet::Util::Log.newdestination(:console)

  let(:facts) { {:concat_basedir => '/dne', :osfamily => 'Debian'} }
  let(:pre_condition) {'class { "exim": }' }

  
  describe 'local_part_prefix' do
     let(:title) { 'testrouter' }
     let(:params) { { :local_part_prefix => '*-',
                      :order => '1',
                      :driver => 'redirect' } }

     it { should contain_concat__fragment('router-testrouter').with_content(/^\s+local_part_prefix\s+=\s\*-/) }
  end
end
