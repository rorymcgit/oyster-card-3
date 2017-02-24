require 'journey'
require 'oystercard'

describe Journey do
  subject(:journey) { described_class.new }
  let(:card) { double }
  let(:entry_station) { double }
  let(:exit_station) { double }

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
    it 'gives a penalty fare if no entry station was recorded' do
      journey.end_journey(exit_station)
      expect(journey.fare).to eq(described_class::PENALTY_FARE)
    end
    it 'gives a penalty fare if no exit station was recorded' do
      journey.start_journey(entry_station)
      journey.start_journey(entry_station)
      expect(journey.fare).to eq(described_class::PENALTY_FARE)
    end
    it 'gives the minimum fare if the journey was completed' do
      journey.start_journey(entry_station)
      journey.end_journey(exit_station)
      expect(journey.fare).to eq(described_class::MINIMUM_FARE)
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

  describe '#all_journeys' do

    it 'checks to see if the journeys list is empty by default' do
      expect(journey.all_journeys).to be_empty
    end

    it 'records a single journey in a hash, which is appended to an array' do
      journey.start_journey(entry_station)
      journey.end_journey(exit_station)
      expect(journey.all_journeys.length).to eq(1)
    end
  end

end
