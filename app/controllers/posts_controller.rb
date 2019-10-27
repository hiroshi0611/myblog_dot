class PostsController < ApplicationController
    def index
        @posts = Post.all.order(created_at: 'DESC')
    end

    def show
        # @posts = Post.new
        @posts = Post.find(params[:id])
    end

    def new
        @posts = Post.new
    end

    def create
        @posts = Post.new(post_params)
        if @posts.save
            flash[:success] = '登録成功しました'
            redirect_to root_path
        else
          flash[:danger] = "入力してください"
          render :new
        end
        
    end

    def post_params
        params.require(:post).permit(:title, :body)
    end
end
