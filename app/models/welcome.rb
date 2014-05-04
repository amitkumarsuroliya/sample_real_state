class Welcome 

	require 'csv-mapper'

	include CsvMapper

	def fetch_csv
		results = import('quikr_gurgaon.csv') do
		  start_at_row 1
		  [project, link, price, room,room_link,area, area_link, person, person_link,updated_at]
		end
	end
end