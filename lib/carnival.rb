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

  def summary
    visitor_summary = {}
    total_money_spent = Hash.new(0)

    @rides.each do |ride|
      ride.rider_log.each do |visitor, ride_count|
        total_money_spent[visitor] += ride_count * ride.admission_fee
        favorite_ride = visitor.preferences.include?(ride.excitement) ? ride.name : nil
        if visitor_summary[visitor].nil?
          visitor_summary[visitor] = {
            favorite_ride: favorite_ride,
            total_money_spent: total_money_spent[visitor]
          }
        else
          visitor_summary[visitor][:total_money_spent] = total_money_spent[visitor]
        end
      end
    end

    {
      visitor_count: visitor_summary.length,
      revenue_earned: carnival_revenue,
      visitors: visitor_summary
    }
  end

end