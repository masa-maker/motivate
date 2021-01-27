require 'rails_helper'

RSpec.describe "投稿する", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
    
  end

  context '投稿ができる時' do
    it 'ログインしたユーザーは新規投稿ができる' do
      #ログインする
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(page).to have_content("投稿する")
      #新規投稿ページに移動する
      visit new_post_path
      #フォームに情報を入力する
      image_path = Rails.root.join('public/images/people.jpg')
      attach_file('post[image]', image_path)
      fill_in 'post[text]', with: "テスト"
      find('input[name="commit"]').click
      #トップページへ遷移する
      expect(current_path).to eq root_path
    end
  end

  context '投稿ができない時' do
    it 'ログインしていないユーザーは新規投稿できない' do
      #トップページに遷移する
      visit root_path
      #投稿するボタンがない
      expect(page).to have_no_content("投稿する")
    end
  end
end

RSpec.describe "投稿を編集する", type: :system do
  before do
    @post = FactoryBot.create(:post)
    @user = FactoryBot.create(:user)
  end
  context '投稿が編集できる時' do
    it 'ログインしたユーザーは自分が投稿した投稿を編集できる' do
      #投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @post.user.email
      fill_in 'Password', with: @post.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      #投稿した内容に編集ボタンがある
      expect(page).to have_content("編集")
      #編集画面へ遷移する
      visit edit_post_path(@post)
      #フォームを送信する
      find('input[name="commit"]').click
      #トップページへ遷移することを確認する
      expect(current_path).to eq root_path
    end
  end

  context '投稿が編集できない時'do
    it 'ログインしたユーザーが投稿者本人以外であれば編集できない' do
      #投稿していないユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      #投稿には編集ボタンがないことを確認する
      expect(page).to have_no_content("編集")
    end
    it 'ログインしていないと投稿を編集することができない' do
      #トップページに移動する
      visit root_path
      #投稿には編集ボタンがないことを確認する
      expect(page).to have_no_content("編集")
    end
  end
end

RSpec.describe "投稿を編集する", type: :system do
  before do
    @post = FactoryBot.create(:post)
    @user = FactoryBot.create(:user)
  end
  context '投稿が削除できる時' do
    it 'ログインしたユーザーは自分が投稿した投稿を削除できる' do
      #投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @post.user.email
      fill_in 'Password', with: @post.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      #投稿した内容に削除ボタンがある
      expect(page).to have_content("削除")    
      #削除ボタンを押す
      click_on('削除')
      #トップページへ遷移することを確認する
      expect(current_path).to eq root_path
    end
  end
  context '投稿が削除できない時'do
    it 'ログインしたユーザーが投稿者本人以外であれば削除できない' do
      #投稿していないユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      #投稿には編集ボタンがないことを確認する
      expect(page).to have_no_content("削除")
    end
    it 'ログインしていないと投稿を削除することができない' do
      #トップページに移動する
      visit root_path
      #投稿には編集ボタンがないことを確認する
      expect(page).to have_no_content("削除")
    end
  end
  
end