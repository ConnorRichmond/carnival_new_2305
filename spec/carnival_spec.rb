require 'spec_helper'

describe Carnival do

  before(:each) do
    @witchlight = Carnival.new(6)
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor2.add_preference(:thrilling)
    @visitor3.add_preference(:thrilling)
    @witchlight.add_ride(@ride1)
    @witchlight.add_ride(@ride2)
    @witchlight.add_ride(@ride3)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor3)
    @ride2.board_rider(@visitor2)
    @ride2.board_rider(@visitor3)
    @ride3.board_rider(@visitor2)
    @ride3.board_rider(@visitor3)
  end

  describe '#initialize' do
    it 'exists with attributes' do
      expect(@witchlight).to be_a(Carnival)
      expect(@witchlight.rides).to eq([@ride1, @ride2, @ride3])
    end
  end

  describe 'most popular ride' do
    it 'has a most popular ride' do
      expect(@witchlight.most_popular_ride).to eq(@ride1)
    end
  end

  describe 'most profitable ride' do
    it 'has a most profitable ride' do
      expect(@witchlight.most_profitable_ride).to eq(@ride2)
    end
  end

  describe 'carnival_revenue' do
    it 'returns carnivals total revenue' do
      expect(@witchlight.carnival_revenue).to eq((8))
    end
  end




end