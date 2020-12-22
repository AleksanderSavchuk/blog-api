class PostsRepository
  attr_reader :model

  def initialize(model: PostContainer['post'])
    @model = model
  end

  def find(id)
    model.find(id)
  end

  def create(attrs)
    model.create(attrs)
  end

  def update(id, attrs)
    model.find(id).update(attrs)
  end

  def destroy(record)
    record.destroy
  end
end
