require 'rails_helper'

RSpec.describe "コメント投稿", type: :system do
  before do
    @post = FactoryBot.create(:post)
    @comment = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーは投稿詳細ページでコメント投稿できる' do
    # ログインする
    visit new_user_session_path
    fill_in 'Email', with: @post.user.email
    fill_in 'Password', with: @post.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    # 投稿詳細ページに遷移する
    visit post_path(@post)
    # フォームに情報を入力する
    fill_in 'comment_comment', with: @comment
    click_on('コメントする')
    # 投稿詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq post_path(@post)
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @comment
  end

  it 'ログインしていない場合は投稿詳細ページへ遷移することができない' do
    #トップページへ遷移する
    visit root_path
    #投稿詳細ページへ遷移する
    visit post_path(@post)
    #トップページへ遷移される
    visit root_path
  end
end
