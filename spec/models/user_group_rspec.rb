require 'rails_helper'

describe UserGroup do
  context 'can save' do
    describe '#create' do
      it "is invalid" do
        group = create(:group)
        user = create(:user)
        user_group = build(:user_group, user_id: user.id, group_id: group.id)
        expect(user_group).to be_valid
      end
    end
    context 'can not save' do

      it "is invalid without user_id" do
        group = create(:group)
        user = create(:user)
        user_group = build(:user_group, user_id: "", group_id: group.id)
        user_group.valid?
        expect(user_group.errors[:user_id]).to include('を入力してください')
      end

      it "is invalid without group_id" do
        group = create(:group)
        user = create(:user)
        user_group = build(:user_group, user_id: user.id, group_id: "")
        user_group.valid?
        expect(user_group.errors[:group_id]).to include('を入力してください')
      end
    end
  end
end
