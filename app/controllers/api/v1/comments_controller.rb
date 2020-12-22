module Api
  module V1
    class CommentsController < ApplicationController
      schema(:create) do
        required(:commenter).value(:string) 
        required(:body).value(:string)
        required(:post_id).value(:integer)
      end

      def create
        result = resolve('comments.create').call(safe_params.to_h)
        if result.success?
          render json: result.success
        else
          render json: { errors: result.failure.errors.to_h }, status: :unprocessable_entity
        end
      end
    end
  end
end
