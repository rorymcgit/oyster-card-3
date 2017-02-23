class Journey
attr_reader :journey
  MINIMUM_FARE = 2.50
  PENALTY_FARE = 6

  def initialize
    @all_journeys = []
    @touched_in = false
  end

  def start_journey(entry_station)
    @journey = {}
    @journey[:entry] = entry_station
    @touched_in = true

  end

  def end_journey(exit_station)
    @journey[:exit] = exit_station
    @all_journeys << @journey
    @touched_in = false
  end

  def start_journey_charge
    PENALTY_FARE
  end

  def end_journey_charge
    @touched_in ? MINIMUM_FARE : PENALTY_FARE
  end

  def in_journey?
    !!@touched_in
  end
end
