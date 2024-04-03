class SearchController < ApplicationController
  def search
    @search = params[:search]
    puts @search
    puts "here"
    #passes search location parameter to the home controller and reloads the home page
    redirect_to root_path(search: @search)
  end
end
