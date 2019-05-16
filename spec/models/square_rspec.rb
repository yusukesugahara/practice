require 'rails_helper'

describe Square do

  let(:user)   {create(:user)}

  describe '#create' do
    context 'can save' do
      it "is valid" do
        square = build(:square, user_id: user.id)
        expect(square).to be_valid
      end

      it "is valid without one" do
        square = build(:square, user_id: user.id,one: "")
        expect(square).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without name' do
        square = build(:square, name: "")
        square.valid?
        expect(square.errors[:name]).to include("を入力してください")
      end

      it 'is invalid without user_id' do
        square = build(:square, user_id: "")
        square.valid?
        expect(square.errors[:user_id]).to include("を入力してください")
      end
    end
  end
end

