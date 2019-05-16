require 'rails_helper'

describe Square do

  let(:group)   {create(:group)}

  describe '#create' do
    context 'can save' do
      it "is valid" do
        plan = build(:plan, group_id: group.id)
        expect(plan).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without date' do
        plan = build(:plan,date: "")
        plan.valid?
        expect(plan.errors[:date]).to include("を入力してください")
      end

      it 'is invalid without name' do
        plan = build(:plan, name: "")
        plan.valid?
        expect(plan.errors[:name]).to include("を入力してください")
      end

      it 'is invalid without text' do
        plan = build(:plan, text: "")
        plan.valid?
        expect(plan.errors[:text]).to include("を入力してください")
      end

      it 'is invalid without group_id' do
        plan = build(:plan, group_id: "")
        plan.valid?
        expect(plan.errors[:group_id]).to include("を入力してください")
      end

      it 'is invalid not type date' do
        plan = build(:plan,date: "aaaaaaa")
        plan.valid?
        expect(plan.errors[:date][1]).to include("正しい形式で入力してください")
      end

    end
  end
end

