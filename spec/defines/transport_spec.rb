require 'spec_helper'

describe 'exim::transport', type: 'define' do
  let(:title) { 'testtransport' }
  let(:pre_condition) { 'class { "exim": }' }

  describe 'define test' do
    let(:params) { { driver: 'accept' } }

    it { is_expected.to contain_concat__fragment('transport-header') }
  end

  integer_parameter = ['batch_max', 'port', 'connection_max_messages', 'tls_dh_min_bits']

  integer_parameter.each do |parameter|
    describe parameter do
      context 'is set' do
        let(:params) { { parameter => 42, driver: 'appendfile' } }

        it { is_expected.to contain_concat__fragment('transport-testtransport').with_content(%r{^\s+#{parameter}\s+=\s42$}) }
      end
      context 'is unset' do
        let(:params) { { driver: 'appendfile' } }

        it { is_expected.to contain_concat__fragment('transport-testtransport').without_content(%r{^\s+#{parameter}}) }
      end
    end
  end

  string_parameter = ['directory', 'maildir_tag', 'command', 'connect_timeout', 'directory_mode',
                      'file', 'group', 'home_directory', 'message_prefix', 'message_suffix',
                      'mode', 'subject', 'text', 'to', 'transport_filter', 'user', 'socket',
                      'interface', 'helo_data', 'timeout', 'path', 'from', 'message_size_limit']

  string_parameter.each do |parameter|
    describe parameter do
      context 'is set' do
        let(:params) { { parameter => 'foobar', driver: 'appendfile' } }

        it { is_expected.to contain_concat__fragment('transport-testtransport').with_content(%r{^\s+#{parameter}\s+=\sfoobar$}) }
      end
      context 'is unset' do
        let(:params) { { driver: 'appendfile' } }

        it { is_expected.to contain_concat__fragment('transport-testtransport').without_content(%r{^\s+#{parameter}}) }
      end
    end
  end

  array_parameter = ['temp_errors', 'hosts', 'headers_remove', 'fallback_hosts', 'hosts_require_tls']

  array_parameter.each do |parameter|
    describe parameter do
      context 'is set' do
        let(:params) { { parameter => ['foo', 'bar'], driver: 'appendfile' } }

        it { is_expected.to contain_concat__fragment('transport-testtransport').with_content(%r{^\s+#{parameter}\s+=\sfoo\s*:\s*bar$}) }
      end
      context 'is unset' do
        let(:params) { { driver: 'appendfile' } }

        it { is_expected.to contain_concat__fragment('transport-testtransport').without_content(%r{^\s+#{parameter}}) }
      end
    end
  end

  bool_parameter = ['delivery_date_add', 'envelope_to_add', 'freeze_exec_fail', 'initgroups',
                    'log_output', 'maildir_format', 'return_path_add', 'rcpt_include_affixes',
                    'allow_localhost', 'return_output', 'return_fail_output', 'timeout_defer']

  bool_parameter.each do |parameter|
    describe parameter do
      context 'is true' do
        let(:params) { { parameter => true, driver: 'appendfile' } }

        it { is_expected.to contain_concat__fragment('transport-testtransport').with_content(%r{^\s+#{parameter}$}) }
      end
      context 'is false' do
        let(:params) { { parameter => false, driver: 'appendfile' } }

        it { is_expected.to contain_concat__fragment('transport-testtransport').without_content(%r{^\s+#{parameter}}) }
      end
      context 'is unset' do
        let(:params) { { driver: 'appendfile' } }

        it { is_expected.to contain_concat__fragment('transport-testtransport').without_content(%r{^\s+#{parameter}}) }
      end
    end
  end

  describe 'headers_add' do
    context 'is set' do
      let(:params) { { headers_add: ['foo', 'bar'], driver: 'appendfile' } }

      it { is_expected.to contain_concat__fragment('transport-testtransport').with_content(%r{^\s+headers_add\s+=\sfoo\\nbar$}) }
    end
    context 'is unset' do
      let(:params) { { driver: 'appendfile' } }

      it { is_expected.to contain_concat__fragment('transport-testtransport').without_content(%r{^\s+headers_add}) }
    end
  end

  describe 'comment' do
    let(:params) { { comment: ['foo'], driver: 'appendfile' } }

    it { is_expected.to contain_concat__fragment('transport-testtransport').with_content(%r{^# foo$}) }
  end

  describe 'exim_environment' do
    context 'is set' do
      let(:params) { { exim_environment: [{ a: 'b' }, { c: 'd' }, { e: 'f' }], driver: 'appendfile' } }

      it { is_expected.to contain_concat__fragment('transport-testtransport').with_content(%r{^\s+environment\s+=\sa=b\s*:\s*c=d\s*:\s*e=f$}) }
    end
    context 'is unset' do
      let(:params) { { driver: 'appendfile' } }

      it { is_expected.to contain_concat__fragment('transport-testtransport').without_content(%r{^\s+environment}) }
    end
  end
end
