class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  before_action :teacher_user,     only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "News Uploaded"
      redirect_to @article
    else
      flash[:error] = @article.errors.first
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article= Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:success] = "Updated"
      redirect_to @article
    else
      flash[:error] = @article.errors.first
      render 'edit'
    end
  end

  def destroy
    Article.find_by_id(params[:id]).try(:delete) ? flash[:success] = "Article deleted" : flash[:error] = "Something went wrong!"
    redirect_to articles_url
  end

  private
   
    def article_params
      params.require(:article).permit(:title, :content)
    end

    def teacher_user
      redirect_to(root_url) unless current_user.teacher?
    end



end
