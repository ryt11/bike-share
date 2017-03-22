    require_relative '../spec_helper'
require 'pry'

RSpec.describe "A user can view trip" do
  before(:each) {Trip.create(duration: 63, start_date: "2013/8/28", start_station_name: "South Van Ness at Market", end_date: "2013/08/29", end_station_name: "South Van Ness at Market", bike_id: 520, subscription_type_id: "Subscriber", zip_code: 94127)}
  
  it "and has all content" do
    visit '/trips/1'
    within("ul li:nth-child(1)") do
      expect(page).to have_content("Duration: 63")
    end
    within("ul li:nth-child(2)") do
      expect(page).to have_content("Start Date: 2013-08-28")
    end
    within("ul li:nth-child(3)") do
      expect(page).to have_content("Start Station Name: South Van Ness at Market")
    end
    within("ul li:nth-child(4)") do
      expect(page).to have_content("End Date: 2013-08-29")
    end
    within("ul li:nth-child(5)") do
      expect(page).to have_content("End Station Name: South Van Ness at Market")
    end
     within("ul li:nth-child(6)") do
      expect(page).to have_content("Bike ID: 520")
    end
     within("ul li:nth-child(7)") do
      expect(page).to have_content("Subscription type: Subscriber")
    end
     within("ul li:nth-child(8)") do
      expect(page).to have_content("Zip Code: 94127")
    end
  end

  it "has an edit button" do
    visit '/trips/1'
    expect(page).to have_button('Edit')
    page.click_link('', :href => '/trips/1/edit')
    expect(current_path).to eq('/trips/1/edit')
  end

  it "has an delete button" do
    visit '/trips/1'
    expect(page).to have_button('Delete')
    click_on "Delete"
    expect(current_path).to eq('/trips/page/1')
  end
end
