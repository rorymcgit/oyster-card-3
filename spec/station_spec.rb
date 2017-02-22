require 'station'

describe Station do
  let(:name) { "name" }
  let(:zone) { 2 }
  subject(:station) { described_class.new(name, zone) }

  context 'When initializing Station' do
    it 'it provides a Station #name' do
      expect(station.name).to eq(name)
    end

    it 'it provides a Station #zone' do
      expect(station.zone).to eq(zone)
    end
  end

end
