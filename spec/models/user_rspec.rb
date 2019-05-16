require 'rails_helper'

describe User do
  describe '#create' do
    context 'can save' do
      it "is valid" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "is valid with a nickname that has less than 20 characters " do
        user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaa")
        expect(user).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without nickname' do
        user = build(:user, nickname: "")
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end

      it "is invalid with a nickname that has more than 21 characters " do
        user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa")
        user.valid?
        expect(user.errors[:nickname][0]).to include("以内で入力してください")
      end
    end
  end
end

