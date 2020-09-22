require 'spec_helper'

describe 'exim::router', type: 'define' do
  let(:pre_condition) { 'class { "exim": }' }
  let(:title) { 'testrouter' }

  describe 'define test' do
    let(:params) { { driver: 'accept' } }

    it { is_expected.to contain_exim__router('testrouter') }
    it { is_expected.to contain_concat__fragment('router-header') }
    it { is_expected.to contain_concat__fragment('router-testrouter') }
  end

  ['caseful_local_part', 'retry_use_local_part'].each do |parameter|
    describe parameter do
      let(:params) { { parameter => true, order: 1, driver: 'redirect' } }

      it { is_expected.to contain_concat__fragment('router-testrouter').with_content(%r{^\s+#{parameter}\s+=\s+true$}) }
    end
  end
  ['local_part_prefix', 'local_part_suffix', 'self', 'file'].each do |parameter|
    describe parameter do
      let(:params) { { parameter => 'foo', order: 1, driver: 'redirect' } }

      it { is_expected.to contain_concat__fragment('router-testrouter').with_content(%r{^\s+#{parameter}\s+=\s+foo$}) }
    end
  end

  ['ignore_target_hosts'].each do |parameter|
    describe parameter do
      let(:params) { { parameter => ['foo', 'bar'], order: 1, driver: 'redirect' } }

      it { is_expected.to contain_concat__fragment('router-testrouter').with_content(%r{^\s+#{parameter}\s+=\s+foo : bar$}) }
    end
  end

  describe 'comment' do
    let(:params) { { comment: ['foo'], order: 1, driver: 'redirect' } }

    it { is_expected.to contain_concat__fragment('router-testrouter').with_content(%r{^# foo$}) }
  end

  describe 'disable' do
    let(:params) { { order: 1, driver: 'redirect', disable: true } }

    it { is_expected.not_to contain_concat__fragment('router-testrouter') }
  end

  ['local_part_prefix_optional', 'local_part_suffix_optional'].each do |parameter|
    describe parameter do
      context 'is true' do
        let(:params) { { parameter => true, order: 1, driver: 'redirect' } }

        it { is_expected.to contain_concat__fragment('router-testrouter').with_content(%r{^\s+#{parameter}$}) }
      end
      context 'is false' do
        let(:params) { { parameter => false, order: 1, driver: 'redirect' } }

        it { is_expected.to contain_concat__fragment('router-testrouter').without_content(%r{^\s+#{parameter}}) }
      end
      context 'is unset' do
        let(:params) { { order: 1, driver: 'redirect' } }

        it { is_expected.to contain_concat__fragment('router-testrouter').without_content(%r{^\s+#{parameter}}) }
      end
    end
  end
  describe 'require_files is set' do
    let(:params) { { require_files: ['foo', '/bar'], order: 1, driver: 'redirect' } }

    it { is_expected.to contain_concat__fragment('router-testrouter').with_content(%r{^\s+require_files\s*=\s*foo:/bar$}) }
  end
  describe 'require_files is unset' do
    let(:params) { { order: 1, driver: 'redirect' } }

    it { is_expected.to contain_concat__fragment('router-testrouter').without_content(%r{^\s+require_files\s*=}) }
  end
end
