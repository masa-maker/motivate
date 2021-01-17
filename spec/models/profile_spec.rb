require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe '#create' do
    before do
      @profile = FactoryBot.build(:profile)
    end

    describe "プロフィール作成機能" do
      context "プロフィール作成できる時" do
        it "info,imageがあれば作成できる" do
          expect(@profile).to be_valid
        end

        it "imageがあれば作成できる" do
          @profile.info = nil
          expect(@profile).to be_valid
        end

        it "textがあれば作成できる" do
          @profile.image = nil
          expect(@profile).to be_valid
        end
      end
    end
  end
end
