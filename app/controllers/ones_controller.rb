class OnesController < ApplicationController
    def index
    	@articles = Article.where(approved: true).order(created_at: :desc)
    end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(ariticle_params)
		if @article.save
		  redirect_to one_path(@article)
	    else
	      render "new"
	    end	

	end

	def show
		@article= Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(ariticle_params)
		  redirect_to ones_path	
	    else
		  render "edit"
	    end
		
	end

	private
	def ariticle_params
		params.require(:one).permit(:title,:text, :image)
	end
end
