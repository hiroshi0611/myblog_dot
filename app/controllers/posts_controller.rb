class PostsController < ApplicationController
    def index
        @posts = Post.all.order(created_at: 'DESC')
    end

    def show
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
          flash.now[:danger] = "項目を入力してください"
          render :new
        end
        
    end

    def edit
        @posts = Post.find(params[:id])
    end

    def update
        @posts = Post.find(params[:id])
        if @posts.update(post_params)
            flash[:success] = '成功しました'
            redirect_to root_path
        else
          flash.now[:danger] = "項目を入力してください"
          render :new
        end

    end

    def destroy
        @posts = Post.find(params[:id])
        @posts.destroy
        flash[:success] = '成功しました'
        redirect_to root_path
    end

    def post_params
        params.require(:post).permit(:title, :body)
    end
end
