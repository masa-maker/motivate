require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    describe "コメント投稿機能" do
      context "コメントができる時" do
        it "commentがあれば作成できる" do
          expect(@comment).to be_valid
        end
      end
        
      context "コメントができない時" do
        it "commentがなければ作成できない" do
          @comment.comment = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Commentを入力してください")
        end
      end
    end
  end
end
