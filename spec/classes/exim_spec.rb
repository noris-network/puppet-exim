require 'spec_helper'

describe 'exim', :type => :class do

  let(:facts) { {:osfamily => 'Debian', :concat_basedir => '/dne'} }
  it { should create_class('exim') }
  it { should contain_class('exim') }
  it { should contain_class('exim::install').that_comes_before('Class[exim::config]') }

  context "macro set" do
    let(:params) { { 'macros' => { 'CONFDIR' => '/etc/exim' } } }
    it { should contain_concat__fragment('main').with_content(/^CONFDIR=\/etc\/exim$/) }
  end

  context "includes" do
    let(:params) { { 'includes' => [ 'foo' ] } }
    it { should contain_concat__fragment('main').with_content(/^\.include foo$/) }
  end

  [ 'acl_smtp_mail','acl_smtp_rcpt','acl_smtp_data','acl_smtp_mime' ].each do |acl|
    context acl do
      let(:params) { { acl => 'acl_check' } }
      it { should contain_concat__fragment('acl-header').with_content(/^#{acl}\s+= acl_check$/) }
    end
  end

end
