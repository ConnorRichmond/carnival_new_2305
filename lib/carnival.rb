class Carnival

  attr_reader :duration, :rides

  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    @rides.max_by { |ride| ride.total_riders }
  end

  def most_profitable_ride
    @rides.max_by { |ride| ride.total_revenue }
  end

  def carnival_revenue
    total = 0
    @rides.each do |ride|
      total += ride.total_revenue
    end
    total
  end

end