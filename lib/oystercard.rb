require_relative 'journey'

class Oystercard

  LIMIT = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @journey = Journey.new
  end

  def top_up(amount)
    check_top_up_amount_against_min_and_max_limits(amount)
    @balance += amount
  end

  def touch_in(station)
    check_if_sufficient_funds
    deduct(@journey.fare) if @journey.in_journey?
    @journey.start_journey(station)
  end

  def touch_out(station)
    @journey.end_journey(station)
    deduct(@journey.fare)
    @journey = Journey.new
  end

  def journey
    @journey.journey
  end

  private

  def check_if_sufficient_funds
    raise "Insufficient funds, current balance is £#{@balance}" unless sufficient_funds?
  end

  def check_top_up_amount_against_min_and_max_limits(amount)
    raise "Maximum balance of #{LIMIT} exceeded" if @balance + amount > LIMIT
    raise "Unable to top-up." if amount < MINIMUM_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end

  def sufficient_funds?
    @balance >= MINIMUM_BALANCE
  end

end
