require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context "新規登録がうまく行く時" do
      it "name,email,password,password_confirmationが入力されていれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "新規登録がうまくいかない時" do
      it "nameが空では登録できない" do
        @user.name =nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "nameが重複していれば登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.name =@user.name
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Name has already been taken")
      end

      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailは@がなければ登録できない" do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "emailが重複していれば登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages). to include("Email has already been taken")
      end

      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが6文字以下では登録できない" do
        @user.password = 12345
        @user.password_confirmation =12345
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordとpassword_confirmationが一致しなければ登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
