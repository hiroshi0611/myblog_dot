class PostsController < ApplicationController
    def index
        @posts = Post.all.order(ceated_at 'DESC')
    end
end
