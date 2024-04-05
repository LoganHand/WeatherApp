class SearchController < ApplicationController
  def search
    #gets the string entered in the searchbar
    @search = params[:search]
    #calls the Geocoder API using the searched string
    result = Geocoder.search(@search)
    #handling for input of a empty string or an unknown location in the search box
    #TODO: keeps page on current location if an invalid string is entered but reloads the page every time [INEFFCIENT]
    if result.first != nil
      #passes search location parameter to the home controller and reloads the home page
      redirect_to root_path(search: result.first.coordinates)
    end
  end
end
