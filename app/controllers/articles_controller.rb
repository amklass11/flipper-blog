class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    def index
      @articles = Article.all
    end
    
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    respond_to do |format|
        format.html do
    if @article.save
     flash[:notice] = "Article was successfully created"
     redirect_to article_path(@article)
    else
     render 'new'
    end
  end
end
end
  def show
  end
  def update
    if @article.update(article_params)
     flash[:notice] = "Article was updated"
     redirect_to article_path(@article)
    else
     flash[:notice] = "Article was not updated"
     render 'edit'
    end
  end
  def edit
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was deleted"
    redirect_to articles_path
  end
  private
    def article_params
     params.require(:article).permit(:title, :description)
    end
  def set_article
     @article = Article.find(params[:id])
    end
  end