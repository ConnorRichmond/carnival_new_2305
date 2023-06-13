require 'spec_helper'

describe Carnival do

  before(:each) do
    @witchlight = Carnival.new(6)
  end

  describe '#initialize' do
    it 'exists with attributes' do
      expect(@witchlight).to be_a(Carnival)
      expect(@witchlight.rides).to eq([])
    end
  end


end