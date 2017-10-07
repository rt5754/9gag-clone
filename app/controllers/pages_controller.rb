class PagesController < ApplicationController 
  
  def home
  end
  
  def login
  end
  
  def new
    @posts = Post.paginate(page: params[:page], per_page: 3)
    @posts.reverse_order!
  end
  
end