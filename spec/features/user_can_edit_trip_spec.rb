require_relative '../spec_helper'

RSpec.describe "A user sees a form" do
  before(:each) { Trip.create(duration: 63, start_date: "2013/8/28", start_station_name: "South Van Ness at Market", end_date: "2013/08/29", end_station_name: "South Van Ness at Market", bike_id: 520, subscription_type_id: "Subscriber", zip_code: 94127)}

  it "that has duration, start date, start station name, start station id, end date, end station name, end station id, bike id, subsription type id, zip code" do
    visit '/trips/1/edit'
    fill_in "trip[duration]", with: 20
    fill_in "trip[start_date]", with: "2013/08/05"
    fill_in "trip[start_station_name]", with: "Jersey"
    fill_in "trip[end_date]", with: "2013/09/04"
    fill_in "trip[end_station_name]", with: "Jersey"
    fill_in "trip[bike_id]", with: 123
    fill_in "trip[subscription_type_id]", with: "Subscriber"
    fill_in "trip[zip_code]", with: 12345

    click_on "Update Trip"

    expect(current_path).to eq("/trips/page/1")
    expect(page).to have_content("20")
    expect(page).to have_content("2013-08-05")
    expect(page).to have_content("Jersey")
    expect(page).to have_content("2013-09-04")
    expect(page).to have_content("Jersey")
    expect(page).to have_content("123")
    expect(page).to have_content("Subscriber")
    expect(page).to have_content("12345")
  end
end
