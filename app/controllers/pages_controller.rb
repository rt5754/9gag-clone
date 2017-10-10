class PagesController < ApplicationController 
  
  def home
  end
  
  def hot
    @hot_posts = Post.paginate(page: params[:page], per_page: 5)
    @hot_posts.reverse_order!
  end
  
  def trending
    @trending_posts = Post.paginate(page: params[:page], per_page: 5)
    @trending_posts.reverse_order!
  end
  
  def new
    @posts = Post.paginate(page: params[:page], per_page: 3)
    @posts.reverse_order!
  end
  
  def login
  end
  
end