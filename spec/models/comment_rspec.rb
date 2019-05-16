require 'rails_helper'

describe Diary do

  let(:group)  {create(:group)}
  let(:user)   {create(:user)}
  let(:plan)   {create(:plan,group_id: group.id)}
  let(:square) {create(:square,user_id: user.id)}
  let(:diary)  {create(:diary,user_id: user.id,plan_id: plan.id, square_id: square.id)}

  describe '#create' do
    it "is valid" do
      comment = build(:comment,user_id: user.id, diary_id: diary.id)
      expect(comment).to be_valid
    end
  end
end
