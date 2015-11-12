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

  context "daemon_smtp_ports" do
    let(:params) { { 'daemon_smtp_ports' => [ 25, 587 ] } }
    it { should contain_concat__fragment('main').with_content(/^daemon_smtp_ports\s+= 25 : 587$/) }
  end

  [ 'acl_smtp_mail','acl_smtp_rcpt','acl_smtp_data','acl_smtp_mime' ].each do |acl|
    context acl do
      let(:params) { { acl => 'acl_check' } }
      it { should contain_concat__fragment('acl-header').with_content(/^#{acl}\s+= acl_check$/) }
    end
  end

  bool_parameter = [ 'message_logs', 'gnutls_compat_mode' ]
  bool_parameter.each do |parameter|
    context parameter + " set to false" do
      let(:params) { { parameter => false } }
      it { should contain_concat__fragment('main').with_content(/^#{parameter}\s+= false$/) }
    end
    context parameter + " set to true" do
      let(:params) { { parameter => true } }
      it { should contain_concat__fragment('main').with_content(/^#{parameter}\s+= true$/) }
    end
    context parameter + " not set" do
      it { should contain_concat__fragment('main').without_content(/^#{parameter}/) }
    end
  end

  int_parameter = [ 'smtp_accept_max_nonmail', 'smtp_accept_max_per_connection' ]
  int_parameter.each do |parameter|
    context parameter + " set to 47" do
      let(:params) { { parameter => 47 } }
      it { should contain_concat__fragment('main').with_content(/^#{parameter}\s+= 47$/) }
    end
    context parameter + " not set" do
      it { should contain_concat__fragment('main').without_content(/^#{parameter}/) }
    end
  end

end
