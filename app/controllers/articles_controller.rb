class ArticlesController < ApplicationController
  
  def index
    #NOTE : ---Using a plural instance variable is articles--
    @articles = Article.all
    
  end
  
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params[:article].inspect=============rendering of the data entered in Title and description------
    @article = Article.new(article_params)
    if @article.save
      #something
      flash[:success] = "Article was successfully Created!"
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
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = "The article was succesfully deleted!"
    redirect_to articles_path
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article updated Successfully"
      redirect_to article_path(@article)
    else
      render :edit
    end
      
  end
  
  private
  
  def set_article
    @article = Article.find(params[:id])  
  end
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
end