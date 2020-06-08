# frozen_string_literal: true

require 'spec_helper'

describe 'exim::authenticator' do
  let(:title) { 'testauthenticator' }
  let(:params) do
    { driver: 'cram_md5',
      public_name: 'PLAIN' }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to create_concat__fragment('authenticator-header') }
      it { is_expected.to create_concat__fragment('authenticator-testauthenticator') }
    end
  end
end
