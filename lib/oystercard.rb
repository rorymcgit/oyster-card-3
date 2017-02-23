class Oystercard

  LIMIT = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance, :all_journeys

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Maximum balance of #{LIMIT} exceeded" if @balance + amount > LIMIT
    raise "Unable to top-up." if amount < MINIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient funds, current balance is £#{@balance}" unless sufficient_funds?
    deduct(@journey.start_journey_charge) unless @journey == nil
    @journey = Journey.new
    @journey.start_journey(station)
  end

  def touch_out(station)
    @journey.end_journey(station)
    deduct(@journey.end_journey_charge)
    @journey = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def sufficient_funds?
    @balance >= MINIMUM_BALANCE
  end

end
