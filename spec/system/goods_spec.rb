require 'rails_helper'

RSpec.describe "いいねを押す", type: :system do
  before do
    @post = FactoryBot.create(:post)
    @user = FactoryBot.create(:user)
    
  end

  context 'いいねが押せる時' do
    it "ログインしたユーザーで投稿があればいいねを押すことができる" do
      #ログインする
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      
      #いいねボタンをクリックするすることができる
        find(".like_button").click
    end
  end

  context 'いいねが押せない時' do
    it "ログインしていないユーザーはいいねボタンが表示されず、押すことができない" do
      #トップページへ遷移する
      visit root_path
      #いいねボタンがないことを確認する
      expect(page).to have_no_content("good")
    end
  end
end
