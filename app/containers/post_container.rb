module PostContainer
  extend Dry::Container::Mixin

  register('post', Post)
end
