require 'bundler/setup'

require 'sinatra'
require 'sinatra/json'

require 'open-uri'
require 'nokogiri'
require 'json'

get '/docking_stations' do
  doc = Nokogiri::HTML(open('http://www.mibicitubici.gob.ar/estacione.aspx'))
  cdata = doc.at('//*[@id="FormMaster"]/script[1]/text()').content
  json parsed(cdata)
end

def parsed(cdata)
  contents = cdata.scan(/\[\[.+\]\];/)[0]
  instance_eval(contents)
end