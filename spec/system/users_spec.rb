require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context "ユーザー新規登録ができる時" do
    it "正しい情報を入力すれば新規登録ができトップページへ遷移する" do
      #トップページへ移動する
      visit root_path
      #トップページにサインアップページへ遷移するボタンがある
      expect(page).to have_content("サインアップ")
      #新規登録ページへ移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in 'Name', with: @user.name
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password confirmation', with: @user.password_confirmation
      #サインアップボタンを押す
        find('input[name="commit"]').click
      #トップページへ遷移する
      expect(current_path).to eq root_path
      #カーソルを合わせるとログインボタンが表示される
      expect(page).to have_content('ログアウト')
      #サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていない
      expect(page).to have_no_content('サインアップ')
      expect(page).to have_no_content('ログイン')
    end
  end

  context "ユーザー新規登録ができない時" do
    it "誤った情報ではユーザー新規登録ができずに新規登録ページへ遷移する" do
      #トップページへ移動する
      visit root_path
      #トップページにサインアップページへ遷移するボタンがある
      expect(page).to have_content("サインアップ")
      #新規登録ページへ移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in 'Name', with: ""
      fill_in 'Email', with: ""
      fill_in 'Password', with: ""
      fill_in 'Password confirmation', with: ""
      #サインアップボタンを押す
        find('input[name="commit"]').click
      #新規登録ページへ戻される
      expect(current_path).to eq "/users"
    end
  end
end

RSpec.describe "ログイン", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context "ログインができる時" do
    it "保存されているユーザーの情報と合致すればログインできる" do
      # 予め、ユーザーをDBに保存する
      @user = FactoryBot.create(:user)
      #トップページに移動する
      visit root_path
      #トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      #ログインページへ遷移する
      visit new_user_session_path
      #正しいユーザー情報を入力する
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      #ログインボタンをおす
      find('input[name="commit"]').click
      #トップページへ遷移したことを確認する
      expect(current_path).to eq root_path
      #ログアウトボタンが表示されていることを確認する
      expect(page).to have_content('ログアウト')
      #サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('サインアップ')
      expect(page).to have_no_content('ログイン')
    end
  end

  context "ログインができない時" do
    it "保存されているユーザーの情報と合致しないとログインができない" do
      #トップページに移動する
      visit root_path
      #トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      #ログインページへ遷移する
      visit new_user_session_path
      #ユーザー情報を入力する
      fill_in 'Email', with: "test"
        fill_in 'Password', with: "test"
      #ログインボタンをおす
      find('input[name="commit"]').click
      #ログインページへ戻されることを確認する
      expect(current_path).to eq new_user_session_path
    end
  end
end
