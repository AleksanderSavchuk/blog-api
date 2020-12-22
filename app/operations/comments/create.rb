module Comments
  class Create
    include Dry::Monads[:result] 

    Schema = Dry::Schema.Params {
      required(:commenter).filled(:string)
      required(:body).filled(:string)
      required(:post_id).filled(:integer)
    }

    def call(params)
      byebug
      data = Schema.call(params)
      return Failure(data) if data.failure?

      comment = Comment.create(params)

      Success(comment)
    end
  end
end
