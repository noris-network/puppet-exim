# frozen_string_literal: true

require 'spec_helper'

describe 'exim::addresslist' do
  let(:title) { 'testaddresslist' }
  let(:params) do
    { addresses: ['*'] }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to create_concat__fragment('addresslist-testaddresslist') }
    end
  end
end
