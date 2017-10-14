class PagesController < ApplicationController 
  
  def home
  end
  
  def hot
    @hot_posts = Post.where("cached_weighted_score > '2'").paginate(page: params[:page], per_page: 15)
    @hot_posts.reverse_order!
  end
  
  def trending
    @trending_posts = Post.where("cached_weighted_score > '0'").paginate(page: params[:page], per_page: 15)
    @trending_posts.reverse_order!
  end
  
  def new
    @posts = Post.paginate(page: params[:page], per_page: 15)
    @posts.reverse_order!
  end
  
  def login
  end
  
end