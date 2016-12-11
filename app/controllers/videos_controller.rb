class VideosController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@videos = Video.paginate(page: params[:page],per_page: 5).order('created_at DESC')
	end

	def show
		@video = Video.find(params[:id])
	end

	def new
		@video = Video.new
		@video.title = "標題"
		@video.link = "影片連結"
		@video.description = "描述"
	end

	def update
		require_params
		if params[:id] == 'new'
			@video = Video.new
			@video.title = params[:content][:video_title][:value].strip
			@video.link = params[:content][:video_url][:value].strip
			@video.description = params[:content][:video_description][:value].strip
			@video.save!
			render text:""
		else
			@video = Video.find(params[:id])
			@video.title = params[:content][:video_title][:value].strip
			@video.link = params[:content][:video_url][:value].strip
			@video.description = params[:content][:video_description][:value].strip
			@video.save!
			render text: ""
		end
	end

	def destroy
		@video = Video.find(params[:id])
		@video.destroy
		redirect_to videos_path
	end
	private
	def require_params
	params.permit({content: [{video_title: [:type, :value]},{video_url: [:type, :value]},{video_description: [:type, :value]}]},:video_title, :id,:_method)

	end

end
