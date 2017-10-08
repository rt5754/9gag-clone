class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    if logged_in?
      @post = Post.new
    else
      render 'pages/home'
      flash[:warning] = "You have to be logged in to perform that action"
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.upvotes = 0
    set_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def upvote
    if logged_in?
      @post = Post.find(params[:post_id])
      @user = current_user
      if @user.voted_up_on? @post
        flash[:warning] = "You have already upvoted on that"
      else
        @user.likes @post
      end
    else
      flash[:danger] = "You need to be logged in to do that"
    end
    redirect_to params[:page], :page => params[:pagination_page]
  end
  
  def downvote
    if logged_in?
      @post = Post.find(params[:post_id])
      @user = current_user
      if @user.voted_down_on? @post
        flash[:warning] = "You have already voted on that"
      else
        @user.dislikes @post
      end
    else
      flash[:danger] = "You need to be logged in to do that"
    end
    redirect_to params[:page], :page => params[:pagination_page]
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    
    def set_user
      @post.user_id = current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :user_id, :upvotes, :image)
    end
end
