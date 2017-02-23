require 'journey'
require 'oystercard'

describe Journey do

  let(:entry_station) {"Bank Station"}
  let(:exit_station) {"Oxford Circus"}
  subject(:journey) { described_class.new }

  describe '.start_journey' do
    it 'allows a journey to start and sets the entry station' do
      journey.start_journey(entry_station)
      expect(journey.journey[:entry]).to eq entry_station
    end
  end

  describe '.end_journey' do
    it 'allows a journey to end and sets the exit station' do
      journey.start_journey(entry_station)
      expect{ journey.end_journey(exit_station) }.to change { journey.journey[:exit] }.to exit_station
    end
  end

  describe '.fare' do
    it ' gives a penalty fare if no entry station was recorded' do
      journey.end_journey(exit_station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
    it 'gives a penalty fare if no exit station was recorded' do
      journey.start_journey(entry_station)
      journey.start_journey(entry_station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
    it 'gives the minimum fare if the journey was completed' do
      journey.start_journey(entry_station)
      journey.end_journey(exit_station)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end
  end

  describe '.in_journey?' do
    it 'returns true when in journey' do
      journey.start_journey(entry_station)
      expect(journey.in_journey?).to be true
    end
    it 'returns false when not in journey ' do
      journey.start_journey(entry_station)
      journey.end_journey(exit_station)
      expect(journey.in_journey?).to be false
    end
  end

end
