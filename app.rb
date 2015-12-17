require 'bundler/setup'

require 'sinatra'

require 'open-uri'
require 'nokogiri'
require 'json'

DockingStation = Struct.new(:address,
                            :longitude,
                            :latitude,
                            :a,
                            :b,
                            :c,
                            :d,
                            :available_bikes,
                            :anchor,
                            :usage_status,
                            :icon,
                            :id,
                            :station_name,
                            :station_status)

get '/docking_stations' do
  doc = Nokogiri::HTML(open('http://www.mibicitubici.gob.ar/estacione.aspx'), nil, 'utf-8')
  cdata = doc.at('//*[@id="FormMaster"]/script[1]/text()').content

  content_type 'application/json; charset=utf-8'
  { data: parsed(cdata) }.to_json
end

def parsed(cdata)
  contents = instance_eval(cdata.scan(/\[\[.+\]\];/)[0])
  contents.map{ |s| DockingStation.new(*s).to_h }
end