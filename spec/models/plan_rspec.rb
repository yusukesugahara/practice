require 'rails_helper'

describe Square do

  let(:group)   {create(:group)}

  describe '#create' do
    it "is valid" do
      plan = build(:plan, group_id: group.id)
      expect(square).to be_valid
    end
  end
end

