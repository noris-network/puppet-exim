require 'spec_helper'

describe 'exim::acl', :type => :define do

  let(:facts) { {:concat_basedir => '/dne', :osfamily => 'Debian'} }
  let(:pre_condition) {'class { "exim": }' }
  let(:title) { 'testacl' }

  context "with statements" do
    let(:params) { { "statements" => { "accept_hosts" => { "action" => "accept", "conditions" => [ ['hosts', ['','']] ] }}} }
    it { should contain_concat__fragment('acl-testacl').with_content(/accept\s+hosts\s+=/) }
  end

  context "with statements and disable" do
    let(:params) { { "statements" => { "accept_hosts" => { "action" => "accept", "conditions" => [ ['hosts', ['','']] ], "disable" => true }}} }
    it { should contain_concat__fragment('acl-testacl').without_content(/accept\s+hosts\s+=/) }
  end

end
