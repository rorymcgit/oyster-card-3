class Oystercard

  LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 2.50

  attr_reader :balance, :entry_station, :all_journeys

  def initialize
    @balance = 0
    @all_journeys = []
  end

  def top_up(money)
    raise "#{money} pushes your balance over the £#{LIMIT} limit." if money + @balance > LIMIT
    @balance += money
  end

  def touch_in(entry_station)
    raise "Not enough money." if @balance < MINIMUM_BALANCE
    @journey = {} #journey
    @journey[:entry] = entry_station
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    p @journey[:exit] = exit_station
    @all_journeys << @journey
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end

# card = Oystercard.new
# card.top_up(40)
# card.touch_in("Whitechapel")
#
# card.touch_out("shoreditch")
# p "All Journeys: #{card.all_journeys}"
#
#
# p card.touch_in("Penge")
#
# p card.touch_out("Bank")
#
# card.all_journeys
