require 'spec_helper'

describe 'exim::params', type: 'class' do
  let(:facts) { { osfamily: 'Debian', concat_basedir: '/dne' } }

  it { is_expected.to create_class('exim::params') }
end
