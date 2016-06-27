class Address < ActiveRecord::Base
	require 'csv'

	validates_presence_of :first_name, :last_name, :address, :city, :state, :zip_code

	def self.import(file)
		errors = []
		CSV.foreach(file.path, headers: true) do |row|
			row = row.to_hash
			@address = Address.new first_name: row["fname"], last_name: row["lname"], address: row["address"], city: row["city"], state: row["state"], zip_code: row["zip"]
			if @address.valid?
				@address.save!
			else
				errors.push @address.errors.full_messages.to_sentence
				break
			end
		end
		errors
	end
end