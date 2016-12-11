class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show]
	def index
		@articles = Article.paginate(page: params[:page]).order('created_at DESC')
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
		@article.title = "標題"
		@article.content = "內文"
	end

	def update # include create
		if params[:id] == 'new'
			@article = Article.new
			@article.title = params[:content][:article_title][:value]
			@article.content = params[:content][:content][:value]
			@article.head_photo = params[:content][:image_url][:value]
			@article.save!
			redirect_to @article
		else
			@article = Article.find(params[:id])
			@article.title = params[:content][:article_title][:value]
			@article.content = params[:content][:content][:value]
			@article.head_photo = params[:content][:image_url][:value]
			@article.save!
			render text: ""
		end

	end

	# def mercury_update
	# end


	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

end
