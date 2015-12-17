require 'bundler/setup'

require 'sinatra'
require 'open-uri'
require 'nokogiri'

get '/docking_stations' do
  doc = Nokogiri::HTML(open('http://www.mibicitubici.gob.ar/estacione.aspx'))
  doc.at('//*[@id="FormMaster"]/script[1]/text()').content
end