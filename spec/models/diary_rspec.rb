require 'rails_helper'

describe Diary do
  let(:group)  {create(:group)}
  let(:user)   {create(:user)}
  let(:plan)   {create(:plan,group_id: group.id)}
  let(:square) {create(:square,user_id: user.id)}

  describe '#create' do
    context 'can save' do
      it "is valid" do
        diary = build(:diary, user_id: user.id,plan_id: plan.id, square_id: square.id)
        expect(diary).to be_valid
      end
      it "is valid with a text that has less than 10000 characters " do
        diary = build(:diary, text: "a"*10000, user_id: user.id,plan_id: plan.id, square_id: square.id)
        expect(diary).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without text' do
        diary = build(:diary, text: "")
        diary.valid?
        expect(diary.errors[:text]).to include("を入力してください")
      end

      it 'is invalid without user_id' do
        diary = build(:diary, user_id: "")
        diary.valid?
        expect(diary.errors[:user_id]).to include("を入力してください")
      end

      it 'is invalid without square_id' do
        diary = build(:diary, square_id: "")
        diary.valid?
        expect(diary.errors[:square_id]).to include("を入力してください")
      end

      it 'is invalid without square_id' do
        diary = build(:diary, plan_id: "")
        diary.valid?
        expect(diary.errors[:plan_id]).to include("を入力してください")
      end

      it "is invalid with a name that has more than 10001 characters " do
        diary = build(:diary, text: "a"*10001, user_id: user.id,plan_id: plan.id, square_id: square.id)
        diary.valid?
        expect(diary.errors[:text][0]).to include("以内で入力してください")
      end
    end
  end
end

