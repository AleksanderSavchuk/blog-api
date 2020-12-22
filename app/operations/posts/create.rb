module Posts
  class Create 
    include Dry::Monads[:result]

    Schema = Dry::Schema.Params {
      required(:title).filled(:string)
      required(:text).filled(:string)
    }

    def call(params)
      data = Schema.call(params)
      return Failure(data) if data.failure?

      post = Post.create(params)

      Success(post)
    end
  end
end
