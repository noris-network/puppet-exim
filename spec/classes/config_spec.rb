require 'spec_helper'

describe 'exim::config', type: 'class' do
  let(:pre_condition) { 'class{"exim":}' }

  it { is_expected.to create_class('exim::config') }
end
