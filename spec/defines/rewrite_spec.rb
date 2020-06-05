# frozen_string_literal: true

require 'spec_helper'

describe 'exim::rewrite' do
  let(:title) { 'namevar' }
  let(:params) do
    { pattern: 'test@example.com',
      replacement: '*',
      flags: ['f'] }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
