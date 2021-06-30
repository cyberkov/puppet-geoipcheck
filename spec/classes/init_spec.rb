require 'spec_helper'
describe 'geoipcheck' do
  context 'with defaults for all parameters' do
    it { is_expected.to contain_class('geoipcheck') }
  end

  context 'with country parameter' do
    let(:params) do
      { 'countries' => [ 'US', 'GE' ] }
    end

    it { is_expected.to contain_class('geoipcheck') }
    it { is_expected.to contain_file('/usr/local/geoip/check').with_content(%r{ALLOW_COUNTRIES="US GE"}) }
  end

  context 'with one country' do
    let(:params) do
      { 'countries' => [ 'US' ] }
    end

    it { is_expected.to contain_class('geoipcheck') }
    it { is_expected.to contain_file('/usr/local/geoip/check').with_content(%r{ALLOW_COUNTRIES="US"}) }
  end
end
