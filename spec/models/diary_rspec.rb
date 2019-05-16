require 'rails_helper'

describe Diary do
  let(:group)  {create(:group)}
  let(:user)   {create(:user)}
  let(:plan)   {create(:plan,group_id: group.id)}
  let(:square) {create(:square,user_id: user.id)}

  describe '#create' do
    it "is valid" do
      diary = build(:diary,user_id: user.id,plan_id: plan.id, square_id: square.id)
      expect(diary).to be_valid
    end
  end
end

