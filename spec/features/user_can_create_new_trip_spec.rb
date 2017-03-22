require_relative '../spec_helper'

RSpec.describe "As a user tries to create a trip" do
  it "they can enter trip attributes and be redirected to see new content on next page" do
    visit '/trips/new'
    fill_in "trip[duration]", with: 20
    fill_in "trip[start_date]", with: "2013/08/05"
    fill_in "trip[start_station_name]", with: "Jersey"
    fill_in "trip[end_date]", with: "2013/09/04"
    fill_in "trip[end_station_name]", with: "Jersey"
    fill_in "trip[bike_id]", with: 123
    fill_in "trip[subscription_type_id]", with: "Subscriber"
    fill_in "trip[zip_code]", with: 12345

    click_on "Submit"

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
