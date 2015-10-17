class Admin::ArticlesController < AdminController
  before_action :set_article, only: [:edit, :update, :destroy]

  protect_from_forgery :only => :destroy

  def index
    @articles = Article.all

    @articles = @articles.page(params[:page])
  end

  def new
    @article = Article.new
  end

  def edit
    @per_page = params[:page]
    @q = params[:q].present? ? params[:q][:name] : nil
  end

  def update
    @article.update(article_params)
    redirect_to admin_articles_url(page: params[:page], q: params[:q]), notice: 'Update Success'
  end

  def create
    @article = Article.new(article_params)
    @article.save!
    redirect_to admin_articles_url(page: params[:page], q: params[:q]), notice: 'Create Success'
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_url, notice: 'Delete Success'
  end

private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :category)
  end
end