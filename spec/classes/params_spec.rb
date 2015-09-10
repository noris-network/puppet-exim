require 'spec_helper'

describe 'exim::params', :type => :class do
  let(:facts) { {:osfamily => 'Debian', :concat_basedir => '/dne'} }
  it { should create_class('exim::params') }
end
