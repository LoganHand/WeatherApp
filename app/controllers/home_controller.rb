require 'uri'
require 'net/http'
class HomeController < ApplicationController
  def index
    #recives passed data containing long & lat in an array from location search
    @location = params[:search]
    if @location != nil
      #splits the coordinates to prepare them for the open weather api call
      lat = @location.first
      long = @location.second
      url = "https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{long}&units=metric&appid=c8882a9aaf685422d65b897817196730"
    else
      #default location is used which is calgary alberta
      url = "https://api.openweathermap.org/data/2.5/weather?lat=51.05&lon=-114.09&units=metric&appid=c8882a9aaf685422d65b897817196730"
    end
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    @data = JSON.parse(res.body)

    #checking if there is rain/snow data in the returned JSON
    @rain = @data["rain"]
    if @rain == nil
        @rain = "None"
    else
      @rain = @rain["1h"]
    end
    @snow = @data["snow"]
    if @snow == nil
        @snow = "None"
    else
      @snow = @snow["1h"]
    end

    # preparing the data for display
    @temp = @data["main"]["temp"].round
    @temp_high = @data["main"]["temp_max"].round
    @temp_low = @data["main"]["temp_min"].round
    @wind_speed = @data["wind"]["speed"].round
    @visibility = (@data["visibility"]/1000).round

    @date = Date.today.strftime("%b") + " " + Date.today.strftime("%d")
  # puts res.body if res.is_a?(Net::HTTPSuccess)
  end
end
