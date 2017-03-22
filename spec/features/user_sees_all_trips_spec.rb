require_relative '../spec_helper'
require 'pry'

RSpec.describe "A user can view trip" do
  it "and has all content" do
    Trip.create(duration: 63, start_date: "2013/8/28", start_station_name: "South Van Ness at Market", end_date: "2013/08/29", end_station_name: "South Van Ness at Market", bike_id: 520, subscription_type_id: "Subscriber", zip_code: 94127)
    visit '/trips'
   
    expect(page).to have_content("Duration")
    expect(page).to have_content("Start Date")
    expect(page).to have_content("Start Station Name")
    expect(page).to have_content("End Date")
    expect(page).to have_content("End Station Name")
    expect(page).to have_content("Bike ID")
    expect(page).to have_content("Subscription Type")
    expect(page).to have_content("Zip Code")
    
    expect(page).to have_content("63")
    expect(page).to have_content("2013-08-28")
    expect(page).to have_content("South Van Ness at Market")
    expect(page).to have_content("2013-08-29")
    expect(page).to have_content("South Van Ness at Market")
    expect(page).to have_content("520")
    expect(page).to have_content("Subscriber")
    expect(page).to have_content("94127")
  end

  it "and has a create new trip button that links to correct route" do
    visit "/trips"
    page.click_link('', :href => '/trips/new')
    expect(current_path).to eq("/trips/new")
  end

  # it "has an dashboard button" do
  #   visit '/trips-dashboard'
  #   expect(page).to have_button('Dashboard')
  #   page.click_link('', :href => '/trips-dashboard')
  #   expect(current_path).to eq('/trips-dashboard')
  # end

end
