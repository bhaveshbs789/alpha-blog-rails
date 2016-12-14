class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params[:article].inspect=============rendering of the data entered in Title and description------
    @article = Article.new(article_params)
    if @article.save
      #something
      flash[:notice] = "Article was successfully Created!"
      redirect_to article_path(@article)
    else
      render :new
    end
    # @article.save
    # redirect_to article_path(@article)
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end