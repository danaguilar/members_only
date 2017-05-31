class PostsController < ApplicationController
  before_filter :require_login, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.assign_user(@current_user)
    if @post.save
      flash[:success] = "Post has been created"
      redirect_to :root
    else
      flash[:error] = "Post could not be saved"
      render 'new'
    end
  end

  def index
    @posts = Post.all.reverse
    get_current_user
  end



  private
    def require_login
      unless logged_in?
        flash[:warning] = "Login required to access this page"
        redirect_to login_url
      end
    end

    def post_params
      params.require(:post).permit(:body, :title)
    end
end
