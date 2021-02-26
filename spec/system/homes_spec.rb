require 'rails_helper'

RSpec.describe 'ログインページへ進む', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  it 'ログインしていないユーザーがログイン画面へ遷移する' do
    # トップページに遷移する
    visit root_path
    # サインインページに遷移することができる
    visit new_user_session_path
  end

  it 'ログインしていればトップページへ遷移できない' do
    #ログインする
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    find('input[name="commit"]').click
    # トップページへ遷移する
    visit root_path
  end
end
