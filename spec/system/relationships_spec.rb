require 'rails_helper'

RSpec.describe "フォロー機能", type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
  end
  context 'ユーザーをフォローすることができる時' do
    it '他のユーザーが投稿しておりその投稿から個人ページへ遷移し、フォローを押す' do
      #ログインする
      visit new_user_session_path
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      #投稿の名前をクリックする
        find(".user-name").click
      #ユーザー詳細ページへ遷移する
      visit user_path(@user2)
      #フォローするをクリックする
      click_on('フォローする')
      #ユーザー詳細ページへリダイレクトする
      visit user_path(@user2)
      #フォロー中に表示が変わっている
      expect(page).to have_content('フォロー中')
    end
    it '他のユーザーが投稿しておりその投稿から個人ページへ遷移し、フォローを外す' do
      #ログインする
      visit new_user_session_path
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      #投稿の名前をクリックする
        find(".user-name").click
      #ユーザー詳細ページへ遷移する
      visit user_path(@user2)
      #フォローするをクリックする
      click_on('フォローする')
      #ユーザー詳細ページへリダイレクトする
      visit user_path(@user2)
      #フォロー中に表示が変わっている
      expect(page).to have_content('フォロー中')
      #フォロー中をクリックする
      click_on('フォロー中')
      #ユーザー詳細ページへリダイレクトする
      visit user_path(@user2)
      #フォロー中に表示が変わっている
      expect(page).to have_no_content('フォローする')
    end
  end
end
