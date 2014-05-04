class WelcomeController < ApplicationController
	require 'csv' 

	def index
		@result = Welcome.new.fetch_csv
	end

end