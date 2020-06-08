# frozen_string_literal: true

require 'spec_helper'

describe 'exim::acl::statement' do
  let(:title) { 'namevar' }
  let(:params) do
    { acl_id: 1,
      order: 1,
      action: 'deny' }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to create_concat__fragment('acl-1-1') }
    end
  end
end
