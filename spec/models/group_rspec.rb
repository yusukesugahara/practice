require 'rails_helper'

describe Group do

  describe '#create' do
    it "is invalid" do
      group = build(:group)
      user_group = build(:user_group)
      expect(group).to be_valid
    end
    it "is invalid" do
      group = create(:group)
      user = create(:user)
      user_group = build(:user_group,user_id: user.id,group_id: group.id)
      expect(user_group).to be_valid
    end
  end
end
