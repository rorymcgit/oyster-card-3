class Journey
  attr_reader :entry_station, :exit_station
  MINIMUM_FARE = 2.50
  PENALTY_FARE = 6


  def start_journey(entry_station)
    @entry_station = entry_station
  end

  def end_journey(exit_station)
    @exit_station = exit_station
  end

  def fare
    if @entry_station == nil || @exit_station == nil
      PENALTY_FARE
    else
      MINIMUM_FARE
    end
  end

  def in_journey?
    !!@entry_station
  end
end
