class SearchesController < ApplicationController

  	def show
    	@search = Search.find(params[:id])
    	@courses = @search.courses
	end   

end