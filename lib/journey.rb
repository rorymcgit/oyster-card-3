class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :journey, :all_journeys

  def initialize
    @journey = {}
    @all_journeys = []
    @in_journey = false
  end

  def start_journey(entry_station)
    @journey[:entry] = entry_station
    @in_journey = true
  end

  def end_journey(exit_station)
    @journey[:exit] = exit_station
    @all_journeys << @journey
    @in_journey = false
  end

  def fare
    return PENALTY_FARE unless @journey[:entry] && @journey[:exit]
    MINIMUM_FARE
  end

  def in_journey?
    @in_journey
  end


end
