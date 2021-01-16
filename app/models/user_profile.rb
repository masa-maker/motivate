class UserProfile

  include ActiveModel::Model
  attr_accessor :name, :info, :image, :user_id

# ここにバリデーションの処理を書く
  validates :name, presence: true 
  def save
    # 各テーブルにデータを保存する処理を書く
    user = User.create(user_id: user_id)
    Profile.create(image: image, info: info, name: name, user_id: user.id)
  end
end