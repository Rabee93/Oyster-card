require'station'

describe Station do 
    let(:station) { Station.new("station_name", "zone") }
    it'knows its name' do 
        expect(station.name).to eq("station_name")
    end 
    it'knows its zone' do 
        expect(station.zone).to eq('zone')
    end 
end 
  