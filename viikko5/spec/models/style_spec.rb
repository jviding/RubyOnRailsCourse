require 'rails_helper'

RSpec.describe Style, :type => :model do
  pending "when initialized with name Lager" do
    subject{ Style.create name:"Lager" }

    it { should be_valid}
    its(:name) { should eq ("Lager") }
  end
end
