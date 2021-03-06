require 'rails_helper'

RSpec.describe Beer, :type => :model do
  it "is saved with name" do
    beer = Beer.create name:"Karhu"

    expect(beer).to be_valid
    expect(Beer.count).to eq(1)
  end

  it "is not saved without a name" do
    beer = Beer.create

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

end
