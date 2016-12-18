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

	def create
		@article = Article.new
		@article.title = params[:article][:title]
		@article.content = params[:article][:content]
		@article.head_photo = params[:article][:head_photo]
		@article.save!
		redirect_to @article
	end


	def edit
		@article = Article.find(params[:id])
	end

	def update # include create
		@article = Article.find(params[:id])
		@article.title = params[:article][:title]
		@article.content = params[:article][:content]
		@article.head_photo = params[:article][:head_photo]
		@article.save!
		redirect_to @article
	end

	# def mercury_update
	# end


	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

end
