require 'rails_helper'

describe "ngbrewerylist page" do

  before :all do
    self.use_transactional_fixtures = false
    WebMock.disable_net_connect!(allow_localhost:true)
  end

 before :each do
   DatabaseCleaner.strategy = :truncation
   DatabaseCleaner.start

    @brewery1 = FactoryGirl.create(:brewery, name:"Koff", year:1900)
    @brewery2 = FactoryGirl.create(:brewery, name:"Schlenkerla", year:1700)
    @brewery3 = FactoryGirl.create(:brewery, name:"Ayinger", year:1800)
    @style1 = Style.create name:"Lager"
    @style2 = Style.create name:"Rauchbier"
    @style3 = Style.create name:"Weizen"
    @beer1 = FactoryGirl.create(:beer, name:"Nikolai", brewery: @brewery1, style:@style1)
    @beer2 = FactoryGirl.create(:beer, name:"Fastenbier", brewery: @brewery2, style:@style2)
    @beer3 = FactoryGirl.create(:beer, name:"Lechte Weisse", brewery: @brewery3, style:@style3)
 end

  after :each do
    DatabaseCleaner.clean
  end

  after :all do
    self.use_transactional_fixtures = true
  end

  it "shows one known brewery", js:true do
    visit ngbrewerylist_path
    save_and_open_page
    expect(page).to have_content "Koff"
  end

  it "shows breweries in right order", js:true do
    visit ngbrewerylist_path
    find('table').find('tr:nth-child(2)')
    save_and_open_page
    expect(page).to have_content "Ayinger"
  end

  it "shows breweries right by year", js:true do
    visit ngbrewerylist_path
    click_link "year"
    find('table').find('tr:nth-child(2)')
    save_and_open_page
    expect(page).to have_content "Schlenkerla"
  end
end