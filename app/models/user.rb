class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :goods, dependent: :destroy
  has_many :good_posts, through: :goods, source: :post
  has_one :profile
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
