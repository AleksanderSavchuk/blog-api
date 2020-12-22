module Posts
  class Update
    include Dry::Monads[:result]

    Schema = Dry::Schema.Params {
      required(:id).filled(:integer)
      required(:params_for_update).hash do
        required(:title).filled(:string)
        required(:text).filled(:string)
      end
    }

    def call(**params)
      data = Schema.call(params)
      return Failure(data) if data.failure?

      post = Post.find(params[:id])
      post.update(params[:params_for_update])

      Success(post)
    end
  end
end
