# frozen_string_literal: true

require 'spec_helper'

describe 'exim::authenticator' do
  let(:title) { 'namevar' }
  let(:params) do
    { driver: 'cram_md5',
      public_name: 'PLAIN'}
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
