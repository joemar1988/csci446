class ArticlesController < ApplicationController

  before_filter :previous_link, :only => [:edit]
  before_filter :load_authors, :only => [:new, :edit, :update]
  
  def index
    #@articles = Article.all(:include => :author)
	@num_articles = Article.count
	@articles = Article.paginate(:page => params[:page])
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @article = Article.find(params[:id])
	
	respond_to do |format|
		if @article.update_attributes(params[:article])
			redirect_to(session[:redirect], :success => 'Article was successfully updated.')
		else
			format.html { render :action => "edit" }
			format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
		end
	end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end
  
  private

  def previous_link
	session[:redirect] = request.referer
  end
  
  def load_authors
	@authors = Author.all
  end

end