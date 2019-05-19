require 'rails_helper'

describe Diary do

  let(:group)  {create(:group)}
  let(:user)   {create(:user)}
  let(:plan)   {create(:plan,group_id: group.id)}
  let(:square) {create(:square,user_id: user.id)}
  let(:diary)  {create(:diary,user_id: user.id,plan_id: plan.id, square_id: square.id)}

  describe '#create' do
    context 'can save' do
      it "is valid" do
        comment = build(:comment, user_id: user.id, diary_id: diary.id)
        expect(comment).to be_valid
      end

      it "is valid with a text that has less than 1000 characters " do
        comment = build(:comment, text: "a"*1000, user_id: user.id, diary_id: diary.id)
        expect(comment).to be_valid
      end
    end

    context 'can not save' do

      it 'is invalid without text' do
        comment = build(:comment, text: "", user_id: user.id ,diary_id: diary.id)
        comment.valid?
        expect(comment.errors[:text]).to include("を入力してください")
      end

      it 'is invalid without user_id' do
        comment = build(:comment, user_id: "" ,diary_id: diary.id)
        comment.valid?
        expect(comment.errors[:user_id]).to include("を入力してください")
      end

      it 'is invalid without diary_id' do
        comment = build(:comment, user_id: user.id ,diary_id: "")
        comment.valid?
        expect(comment.errors[:diary_id]).to include("を入力してください")
      end

      it "is invalid with a name that has more than 1001 characters " do
        comment = build(:comment, text: "a"*1001, user_id: user.id, diary_id: diary.id)
        comment.valid?
        expect(comment.errors[:text][0]).to include("以内で入力してください")
      end

    end
  end
end
