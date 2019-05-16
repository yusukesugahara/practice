require 'rails_helper'

describe Square do

  let(:user)   {create(:user)}

  describe '#create' do
    it "is valid" do
      square = build(:square, user_id: user.id)
      expect(square).to be_valid
    end
  end
end

