require 'spec_helper'
describe 'mcocustom' do

  context 'with default values for all parameters' do
    it { should contain_class('mcocustom') }
  end
end
