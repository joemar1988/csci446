class ArticlesController < ApplicationController

  before_filter :previous_link, :only => [:edit]
  before_filter :load_authors, :only => [:new, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
	@authors = Author.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])

	if @article.save
        redirect_to(@article, :flash => { :success => 'Article was successfully created.' })
    else
		flash[:error] = 'There was a problem creating the article.'
        render :action => "new"
    end
  end

  def update
    @article = Article.find(params[:id])
	
    if @article.update_attributes(params[:article])
      redirect_to(session[:edit_redirect], :flash => { :success => 'Article was successfully updated.'})
    else
		flash[:error] = 'There was a problem updating the article.'
        render :action => "edit"
	end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

	redirect_to(article_url, :flash => { :success => 'Article was successfully deleted.'})
   
  end
	
  private

  def previous_link
	session[:redirect] = request.referer
  end
  
  def load_authors
	@authors = Author.all
  end

end
