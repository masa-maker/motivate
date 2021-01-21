class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy

  with_options presence: true do
    validates :text
    validates :image
  end
end
