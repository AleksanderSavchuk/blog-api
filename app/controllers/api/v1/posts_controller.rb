module Api
  module V1
    class PostsController < ApplicationController
      schema(:create, :update) do
        required(:title).value(:string)
        required(:text).value(:string)
      end

      def index
        posts = Post.all
        render json: { posts: posts }
      end

      def show
        post = Post.find(params[:id])
        render json: { post: post }
      end

      def create
        result = resolve('posts.create').call(safe_params.to_h)
        if result.success?
          render json: result.success
        else
          render json: { errors: result.failure.errors.to_h }, status: :unprocessable_entity
        end
      end

      def update
        result = resolve('posts.update').call(params[:id], safe_params.to_h)
        if result.success?
          render json: { post: result.success }
        else
          render json: { errors: result.failure.errors.to_h }, status: :unprocessable_entity
        end
      end

      def destroy
        @post = Post.find(params[:id])
        @post.destroy
        render json: { status: 'destroyed' }
      end
    end
  end
end
