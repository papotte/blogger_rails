class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    find_article
  end

  def new
    @article = Article.new
  end

  def edit
    find_article
  end

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}' created!"

    redirect_to article_path(@article)
  end

  def update
    find_article
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' updated!"

    redirect_to article_path(@article)
  end

  def find_article
    @article = Article.find(params[:id])
  end


  def destroy
    find_article
    @title = @article.title
    @article.destroy

    flash.notice = "Article '#{@title} 'deleted!"

    redirect_to articles_path
  end
end
