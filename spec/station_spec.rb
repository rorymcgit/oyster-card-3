require 'station'

describe Station do

  let(:name) { "name" }
  let(:zone) { 2 }
  subject(:station) { described_class.new(name, zone) }

  describe 'Station' do
    it 'it has a #name' do
      expect(station.name).to eq(name)
    end
    it 'it provides a #zone' do
      expect(station.zone).to eq(zone)
    end
  end

end
