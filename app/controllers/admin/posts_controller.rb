module Admin
  class PostsController < BaseController
    def index
      @posts = @current_website.posts
    end

    def new
      @post = @current_website.posts.new
    end

    def create
      @post = @current_website.posts.new(post_params)
      if @post.update(post_params)
        redirect_to admin_posts_path, notice: t(".success")
      else
        render :edit
      end
    end

    def edit
      @post = @current_website.posts.find(params[:id])
    end

    def update
      @post = @current_website.posts.find(params[:id])
      if @post.update(post_params)
        redirect_to admin_posts_path, success: t(".success")
      else
        render :edit
      end
    end

    def destroy
      @current_website.posts.find(params[:id]).destroy
      redirect_to admin_posts_path, success: t(".success")
    end

    private

    def post_params
      params.require(:post).permit(:title, :status, :content)
    end
  end
end
