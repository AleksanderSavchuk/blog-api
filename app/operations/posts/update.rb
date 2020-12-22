module Posts
  class Update 
    include Dry::Monads[:result]

    Schema = Dry::Schema.Params {
      required(:title).filled(:string)
      required(:text).filled(:string)
    }

    def call(id, params)
      data = Schema.call(params)
      return Failure(data) if data.failure?

      post = Post.find(id)
      post.update(params)

      Success(post)
    end
  end
end
