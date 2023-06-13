class Visitor

  attr_reader :name,
              :height,
              :spending_money,
              :preferences

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money
    @preferences = []
  end


  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(height_threshold)
    @height >= height_threshold
  end

  def spend_money(amount)
    #split the spending money from the "$" and reapply after reduction
    @spending_money = (@spending_money.gsub(/\D/, '').to_i - amount).to_s.prepend('$')
  end

end