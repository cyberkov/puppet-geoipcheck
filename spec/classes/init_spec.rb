require 'spec_helper'
describe 'geoipcheck' do

  context 'with defaults for all parameters' do
    it { should contain_class('geoipcheck') }
  end
end
