class SiteController < ApplicationController
  
  def index
    gon.number_articles = Article.all.size
    gon.number_articles_by_page = 10
    gon.all_variables
  end
  
end
