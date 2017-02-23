class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :journey

  def initialize
    @journey = {}
    @in_journey = false
  end

  def start_journey(entry_station)
    @journey[:entry] = entry_station
    @in_journey = true
  end

  def end_journey(exit_station)
    @journey[:exit] = exit_station
    @in_journey = false
  end

  def fare
    return PENALTY_FARE if !@journey[:entry] || !@journey[:exit]
    return MINIMUM_FARE
  end


  def in_journey?
    @in_journey
  end

end
