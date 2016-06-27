require "spec_helper"
require 'rails_helper'

describe AddressesController do
  describe "POST import" do

    before(:each) do
      @file = fixture_file_upload('files/mock.csv', 'text/csv')
    end

    it "redirects to the home page" do
      post :import, file: @file
      expect(response).to redirect_to root_url
    end

    it "adds a flash notice" do
      post :import, file: @file
      expect(flash[:success]).to eq "Successfully Imported Addresses!"
    end

    it "imports the addresses file" do
      post :import, file: @file
      expect(Address.all.count).to eq 500
    end
  end
end