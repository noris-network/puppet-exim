require 'spec_helper'

describe 'exim::router', type: 'define' do
  let(:pre_condition) { 'class { "exim": }' }
  let(:title) { 'testrouter' }

  ['local_part_prefix', 'self', 'file', 'caseful_local_part'].each do |parameter|
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
end
