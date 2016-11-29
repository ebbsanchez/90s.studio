class MainController < ApplicationController
	def index
	end

	def about
	end

	def video
		@videos = Video.all
	end

	def article
	end

end
