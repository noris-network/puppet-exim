# frozen_string_literal: true

require 'spec_helper'

describe 'exim::retry' do
  let(:title) { 'testretry' }
  let(:params) do
    {}
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to create_concat__fragment('retry-header') }
      it { is_expected.to create_concat__fragment('retry-testretry') }
    end
  end
end
