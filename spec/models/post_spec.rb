require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#create' do
    before do
      @post = FactoryBot.build(:post)
    end

    describe "投稿機能" do
      context "投稿ができる時" do
        it "text,imageがあれば投稿できる" do
          expect(@post).to be_valid
        end
      end

      context "投稿できない時" do
        it "textがなければ投稿できない" do
          @post.text = nil
          @post.valid?
          expect(@post.errors.full_messages).to include ("Textを入力してください")
        end

        it "imageがなければ投稿できない" do
          @post.image = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("Imageを入力してください")
        end
      end
    end
  end
end
