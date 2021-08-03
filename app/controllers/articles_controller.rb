class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles.to_json(methods: [:image_url])
  end
  
  def show 
    @article = Article.find(params[:id])
    render json: @article.to_json(methods: [:image_url])
  end
  # def create 
  #   @article = Article.new(article_params)
  #   respond_to do |format|
  #     if @article.save
        
  
  
  
  private
    def article_params
      params.require(:article).permit(:thumbnail, :title, :description, :category)
    end
  
end
