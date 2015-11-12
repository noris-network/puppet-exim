require 'spec_helper'

describe 'exim::router', :type => :define do

  Puppet::Util::Log.level = :info
  Puppet::Util::Log.newdestination(:console)

  let(:facts) { {:concat_basedir => '/dne', :osfamily => 'Debian'} }
  let(:pre_condition) {'class { "exim": }' }
  let(:title) { 'testrouter' }

  [ 'local_part_prefix', 'self' ].each do |option|
    describe option do
      let(:params) { { option => 'foo',
                      :order => '1',
                      :driver => 'redirect' } }

      it { should contain_concat__fragment('router-testrouter').with_content(/^\s+#{option}\s+=\s+foo$/) }
    end
  end

  [ 'ignore_target_hosts' ].each do |option|
    describe option do
      let(:params) { { option => ['foo', 'bar'],
                      :order => '1',
                      :driver => 'redirect' } }

      it { should contain_concat__fragment('router-testrouter').with_content(/^\s+#{option}\s+=\s+foo : bar$/) }
    end
  end

  describe "comment" do
    let(:params) { { :comment => [ 'foo' ],
                     :order => '1',
                     :driver => 'redirect' } }
    it { should contain_concat__fragment('router-testrouter').with_content(/^# foo$/) }
  end

  describe "disable" do
    let(:params) { { :order => '1',
                     :driver => 'redirect',
                     :disable => true } }
    it { should_not contain_concat__fragment('router-testrouter') }
  end
end
