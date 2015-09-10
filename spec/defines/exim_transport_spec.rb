require 'spec_helper'

describe 'exim::transport', :type => :define do

  let(:facts) { {:concat_basedir => '/dne', :osfamily => 'Debian'} }
  let(:title) { 'testtransport' }
  let(:pre_condition) {'class { "exim": }' }

  describe 'driver' do
    context "is unset" do
      let(:params) { { } }
      it { expect { should contain_concat__fragment('transport-testtransport')  }.to raise_error(Puppet::Error, /Must pass/) }
    end
  end

  integer_parameter=[ 'batch_max' ]

  integer_parameter.each do |parameter|
    describe parameter do
      context " is set" do
        let(:params) { { parameter => 42, :driver => 'appendfile' } }
        it { should contain_concat__fragment('transport-testtransport').with_content(/^\s+#{parameter}\s+=\s42$/) }
      end
      context ' is unset' do
        let(:params) { { :driver => 'appendfile' } }
        it { should contain_concat__fragment('transport-testtransport').without_content(/^\s+#{parameter}/) }
      end
      [ 'x','',{},true,[] ].each do |badtype|
        context 'badtype: ' + badtype.class.to_s do
          let(:params) { { parameter => badtype, :driver => 'appendfile' } }
          it { expect { should contain_concat__fragment('transport-testtransport') }.to raise_error(Puppet::PreformattedError,/does not match/) }
        end
      end
    end
  end


  string_parameter=[ 'directory', 'maildir_tag', 'command', 'connect_timeout', 'directory_mode', 
                     'file', 'group', 'home_directory', 'message_prefix', 'message_suffix',
                     'mode', 'subject', 'text', 'to', 'transport_filter', 'user', 'socket' ]

  string_parameter.each do |parameter|

    describe parameter do
      context " is set" do
        let(:params) { { parameter => 'foobar', :driver => 'appendfile' } }
      it { should contain_concat__fragment('transport-testtransport').with_content(/^\s+#{parameter}\s+=\sfoobar$/) }
      end
      context ' is unset' do
        let(:params) { { :driver => 'appendfile' } }
        it { should contain_concat__fragment('transport-testtransport').without_content(/^\s+#{parameter}/) }
      end
      [ [],{},true,'' ].each do |badtype|
        context 'badtype: ' + badtype.class.to_s do
          let(:params) { { parameter => badtype, :driver => 'appendfile' } }
          it { expect { should contain_concat__fragment('transport-testtransport') }.to raise_error(Puppet::PreformattedError,/does not match/) }
        end
      end
    end
  end

  array_parameter=[ 'temp_errors' ]

  array_parameter.each do |parameter|

    describe parameter do
      context " is set" do
        let(:params) { { parameter => ['foo','bar'], :driver => 'appendfile' } }
      it { should contain_concat__fragment('transport-testtransport').with_content(/^\s+#{parameter}\s+=\sfoo\s*:\s*bar$/) }
      end
      context ' is unset' do
        let(:params) { { :driver => 'appendfile' } }
        it { should contain_concat__fragment('transport-testtransport').without_content(/^\s+#{parameter}/) }
      end
      [ '','x',{},true ].each do |badtype|
        context 'badtype:' + badtype.class.to_s do
          let(:params) { { parameter => badtype, :driver => 'appendfile' } }
          it { expect { should contain_concat__fragment('transport-testtransport') }.to raise_error(Puppet::PreformattedError,/is not an Array/) }
        end
      end
    end
  end

  bool_parameter=[ 'delivery_date_add', 'envelope_to_add', 'freeze_exec_fail', 'initgroups', 'log_output', 'maildir_format', 'return_path_add', 'rcpt_include_affixes' ]

  bool_parameter.each do |parameter|

    describe parameter do
      context " is true" do
        let(:params) { { parameter => true, :driver => 'appendfile' } }
      it { should contain_concat__fragment('transport-testtransport').with_content(/^\s+#{parameter}$/) }
      end
      context ' is false' do
        let(:params) { { parameter => false, :driver => 'appendfile' } }
        it { should contain_concat__fragment('transport-testtransport').without_content(/^\s+#{parameter}/) }
      end
      context ' is unset' do
        let(:params) { { :driver => 'appendfile' } }
        it { should contain_concat__fragment('transport-testtransport').without_content(/^\s+#{parameter}/) }
      end
      [ '','x',[],{} ].each do |badtype|
        context 'badtype:' + badtype.class.to_s do
          let(:params) { { parameter => badtype, :driver => 'appendfile' } }
          it { expect { should contain_concat__fragment('transport-testtransport') }.to raise_error(Puppet::PreformattedError,/is not a boolean/) }
        end
      end

    end
  end
end
