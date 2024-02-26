require 'uri'
require 'net/http'
class HomeController < ApplicationController
  def index
    url = "https://api.openweathermap.org/data/2.5/weather?lat=51.05&lon=-114.09&units=metric&appid=c8882a9aaf685422d65b897817196730"
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    @data = JSON.parse(res.body)
  # puts res.body if res.is_a?(Net::HTTPSuccess)
  end
end
