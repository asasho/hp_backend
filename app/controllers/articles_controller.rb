class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
  end
  
  def edit
    @article = Article.find_by(id: params[:id])
  end
  
  def update
    @article = Article.find_by(id: params[:id])
    if @article.update(article_params)
      redirect_to "/admin/articles"
    else
      render 'edit'
    end
  end
  
  # def create 
  #   @article = Article.new(article_params)
  #   respond_to do |format|
  #     if @article.save
        
  
  
  
  private
    def article_parans
      params.require(:article).permit(:thumbnail, :title, :description, :category)
    end
  
end
