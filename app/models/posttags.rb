Class PostTag
  include ActiveModel::ActiveModel
  attr_accrssor :image, :text, :name, :user_id

  with_options presence: true do
    validates :image
    validates :text
    validates :name
  end

  def save
    post = Post.create(post: post)
    tag = Tag.create(name: name)

    PostTag.create(post_id: post.id, tag_id: tag.id, user_id: user.id)
  end
end