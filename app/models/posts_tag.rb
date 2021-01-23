class PostsTag
  include ActiveModel::Model
  attr_accessor :image, :text, :name, :user_id

  with_options presence: true do
    validates :image
    validates :text
    validates :name
  end

  def save
    post = Post.create(text: text, image: image, user_id: user_id)
    tag = Tag.create(name: name)

    PostTag.create(post_id: post.id, tag_id: tag.id)
  end
end