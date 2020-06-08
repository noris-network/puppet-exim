# frozen_string_literal: true

require 'spec_helper'

describe 'exim::hostlist' do
  let(:title) { 'testhostlist' }
  let(:params) do
    { hosts: ['*'] }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to create_concat__fragment('hostlist-testhostlist') }
    end
  end
end
