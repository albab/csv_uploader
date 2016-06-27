require 'spec_helper'

describe Address do
  context "with a new Address" do
    it "doesn't save if not valid" do
      address = Address.create
      address.first_name = "Alex"
      expect {address.save!}.to raise_error ActiveRecord::RecordInvalid
    end
    it "does save if valid" do
      address = Address.create
      address.first_name = "Alex"
      address.last_name = "Babich"
      address.address = "21411 N 67th Dr"
      address.city = "Glendale"
      address.state = "AZ"
      address.zip_code = "85308"
      address.save!
      expect(address.valid?).to eq true
    end
  end
end