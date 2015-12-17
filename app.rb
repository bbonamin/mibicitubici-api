require 'bundler/setup'

require 'sinatra'

require 'open-uri'
require 'nokogiri'
require 'json'

get '/docking_stations' do
  doc = Nokogiri::HTML(open('http://www.mibicitubici.gob.ar/estacione.aspx'), nil, 'utf-8')
  cdata = doc.at('//*[@id="FormMaster"]/script[1]/text()').content

  content_type 'application/json; charset=utf-8'
  parsed(cdata).to_json
end

def parsed(cdata)
  contents = cdata.scan(/\[\[.+\]\];/)[0]
  instance_eval(contents)
end