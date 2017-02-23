class Oystercard

  LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 2.50

  attr_reader :balance, :entry_station, :all_journeys

  def initialize
    @balance = 0
    @all_journeys = []
  end

  def top_up(amount)
    raise "Maximum balance of #{LIMIT} exceeded" if @balance + amount > LIMIT
    raise "Unable to top-up below the amount of #{MINIMUM_BALANCE}" if amount < MINIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient funds - minimum fare is £#{MINIMUM_FARE}, current balance is £#{@balance}" unless sufficient_funds?
    @journey = {} #journey
    @journey[:entry_station] = station
    @entry_station = station
  end

  def touch_out(station)
    @journey[:exit] = station
    @all_journeys << @journey
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def sufficient_funds?
    @balance >= MINIMUM_FARE
  end

end
