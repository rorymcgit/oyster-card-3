require 'journey'
require 'oystercard'

describe Journey do


let(:entry_station) {"Bank Station"}
let(:exit_station) {"Oxford Circus"}
subject(:journey) { described_class.new }

  describe '#start_journey' do
    it 'expects journey to start' do
      journey.start_journey(entry_station)
      expect(journey.journey[:entry]).to eq entry_station
    end
  end
  #it { is_expected.to respond_to(:in_journey?) }

  describe '#end_journey' do
    it ' expects journey to end' do
      journey.start_journey(entry_station)
      expect{ journey.end_journey(exit_station) }.to change { journey.journey[:exit] }.to exit_station
    end
  end

  describe 'calculate the fare' do
    it ' expects zero if touching in correctly' do
    journey.start_journey(entry_station)
    expect(journey.start_journey_charge).to eq 0
    end

    it ' gives a penalty fare of 6 if there was no entry station' do
      journey.end_journey(exit_station)

      expect(journey.fare).to eq 6
    end

    it 'gives a penalty fare of 6 if there was no exit station' do
      expect(journey.fare).to eq 6
    end
  end

  describe 'in_journey?' do
    it 'returns true when in journey' do
      journey.start_journey(entry_station)
      expect(journey.in_journey?).to be true
    end

    it 'returns false when not in journey ' do
      journey.end_journey(exit_station)
      expect(journey.in_journey?).to be false
    end
  end
end
