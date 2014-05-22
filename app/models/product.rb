class Product < ActiveRecord::Base
require 'csv'
 
  def self.import(file)
    CSV.foreach(file.path, headers: true, :encoding => 'ISO-8859-1') do |row|
  		title	= row[0]
  		titlelink	= row[1]
  		price	= row[2]
  		room	= row[3]
  		roomlink	= row[4]
  		area	= row[5]
  		arealink	= row[6]
  		person	= row[7]
  		personlink	= row[8]
  		date			= row[9]
      Product.create!(:title => title,:titlelink => titlelink, :price => price,
      	:room => room,	:roomlink => roomlink, :area => area, :arealink => arealink,
      	:person => person,:personlink => personlink,:date => date)
    end
  end
end
