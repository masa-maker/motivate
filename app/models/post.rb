class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy

  with_options presence: true do
    validates :text
    validates :image
  end

  def liked_by?(user)
    self.goods.where(user_id: user.id).exists?
  end
end
