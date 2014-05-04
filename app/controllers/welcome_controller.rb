class WelcomeController < ApplicationController
	require 'csv'

	def index
		@result1 = Welcome.new.fetch_csv.first
		@result = Welcome.new.fetch_csv
	end

end