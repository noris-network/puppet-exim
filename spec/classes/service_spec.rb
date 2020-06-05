require 'spec_helper'

describe 'exim::service', type: 'class' do
  let(:pre_condition) { 'class{"exim":}' }

  it { is_expected.to create_class('exim::service') }
end
