require 'spec_helper'

describe 'exim', type: 'class' do
  it { is_expected.to create_class('exim') }
  it { is_expected.to contain_class('exim') }
  it { is_expected.to contain_class('exim::install').that_comes_before('Class[exim::config]') }

  ['acl_smtp_mail', 'acl_smtp_rcpt', 'acl_smtp_data', 'acl_smtp_predata', 'acl_smtp_mime'].each do |parameter|
    context parameter do
      let(:params) { { parameter => 'acl_check' } }

      it { is_expected.to contain_concat__fragment('acl-header').with_content(%r{^#{parameter}\s+= acl_check$}) }
    end
  end

  string_parameter = ['acl_not_smtp']
  string_parameter.each do |parameter|
    context parameter + ' set to foo' do
      let(:params) { { parameter => 'foo' } }

      it { is_expected.to contain_concat__fragment('acl-header').with_content(%r{^#{parameter}\s+= foo$}) }
    end
    context parameter + ' not set' do
      it { is_expected.to contain_concat__fragment('acl-header').without_content(%r{^#{parameter}}) }
    end
  end
end
