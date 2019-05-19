require 'rails_helper'

describe Group do
  context 'can save' do
    describe '#create' do
      it "is invalid" do
        group = build(:group)
        user_group = build(:user_group)
        expect(group).to be_valid
      end

      it "is valid with a nickname that has less than 20 characters " do
        group = build(:group, name: "a"*20)
        expect(group).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without name' do
        group = build(:group, name: "")
        group.valid?
        expect(group.errors[:name]).to include("を入力してください")
      end

      it "is invalid with a name that has more than 21 characters " do
        group = build(:group, name: "a"*21)
        group.valid?
        expect(group.errors[:name][0]).to include("以内で入力してください")
      end
    end
  end
end
