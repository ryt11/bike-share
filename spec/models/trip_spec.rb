require_relative "../spec_helper"

RSpec.describe Trip do
  describe "knows attributes" do

    let (:trip) {Trip.create(duration: 63, start_date: "2013/8/28", start_station_name: "South Van Ness at Market", end_date: "2013/08/29", end_station_name: "South Van Ness at Market", bike_id: 520, subscription_type_id: "Subscriber", zip_code: 94127)}

    it "returns trip duration" do
      result = trip.duration
      expect(result).to eq(63)
    end

    it "returns start date" do
      result = trip.start_date
      expect(result).to eq(Date.strptime("2013/8/28", '%Y/%m/%d'))
    end

    it "returns start station name" do
      result = trip.start_station_name
      expect(result).to eq("South Van Ness at Market")
    end

    it "returns end date" do
      
      result = trip.end_date
      expect(result).to eq(Date.strptime("2013/8/29", '%Y/%m/%d'))
    end

    it "returns end station name" do
      result = trip.end_station_name
      expect(result).to eq("South Van Ness at Market")
    end

    it "returns bike id" do
      result = trip.bike_id
      expect(result).to eq(520)
    end

    it "returns subscription type" do
      result = trip.subscription_type_id
      expect(result).to eq("Subscriber")
    end

    it "returns zip code" do
      result = trip.zip_code
      expect(result).to eq(94127)
    end
  end

  describe "validations" do
    it "is invalid without a durtion" do
      trip = Trip.create(start_date: "2013/8/28", start_station_name: "South Van Ness at Market", end_date: "2013/08/29", end_station_name: "South Van Ness at Market", bike_id: 520, subscription_type_id: "Subscriber", zip_code: 94127)
      expect(trip).to_not be_valid
    end

    it "is invalid without a start date" do
      trip = Trip.create(duration: 63, start_station_name: "South Van Ness at Market",  end_date: "2013/08/29", end_station_name: "South Van Ness at Market", bike_id: 520, subscription_type_id: "Subscriber", zip_code: 94127)
      expect(trip).to_not be_valid
    end

    it "is invalid without end date" do
      trip = Trip.create(duration: 63, start_date: "2013/8/28", start_station_name: "South Van Ness at Market", end_station_name: "South Van Ness at Market", bike_id: 520, subscription_type_id: "Subscriber", zip_code: 94127)
      expect(trip).to_not be_valid
    end

    it "is invalid without end station name" do
      trip = Trip.create(duration: 63, start_date: "2013/8/28", start_station_name: "South Van Ness at Market", end_date: "2013/08/29", bike_id: 520, subscription_type_id: "Subscriber", zip_code: 94127)
      expect(trip).to_not be_valid
    end

    it "is invalid without a bike id" do
      trip = Trip.create(duration: 63, start_date: "2013/8/28", start_station_name: "South Van Ness at Market", end_date: "2013/08/29", end_station_name: "South Van Ness at Market", subscription_type_id: "Subscriber", zip_code: 94127)
      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription type id" do
      trip = Trip.create(duration: 63, start_date: "2013/8/28", start_station_name: "South Van Ness at Market", end_date: "2013/08/29", end_station_name: "South Van Ness at Market", bike_id: 520, zip_code: 94127)
      expect(trip).to_not be_valid
    end

    it "is invalid without a zip code" do
      trip = Trip.create(duration: 63, start_date: "2013/8/28", start_station_name: "South Van Ness at Market", end_date: "2013/08/29", end_station_name: "South Van Ness at Market", bike_id: 520, subscription_type_id: "Subscriber")
      expect(trip).to_not be_valid
    end
  

    it "should be valid with all attributes" do
      trip = Trip.create(duration: 63, start_date: "2013/8/28", start_station_name: "South Van Ness at Market", end_date: "2013/08/29", end_station_name: "South Van Ness at Market", bike_id: 520, subscription_type_id: "Subscriber", zip_code: 94127)
      expect(trip).to be_valid
    end
  end
end