class CommentsController < ApplicationController

    def create
        @posts = Post.find(params[:post_id])
        @posts.comments.create(comment_params)
        # @post = Post.new(post_params) + @post.save としてもよい
        redirect_to post_path(@posts)
      end

      def destroy
        @posts = Post.find(params[:post_id])
        @comments = @posts.comments.find(params[:id])
        @comments.destroy
        render template: "posts/show"
      end
    
      private
        def comment_params
          params.require(:comment).permit(:body)
        end
    
    end