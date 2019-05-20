require 'rails_helper'

describe DiariesController do

  let(:user) { create(:user) }
  let(:plan) { create(:plan,group_id: group.id)}
  let(:diary) { create(:diary,group_id: group.id)}
  let(:comment) { create(:comment,user_id: user.id, diary_id: diary.id)}

  describe 'GET #index' do
    before do
      login_user user
    end
    it "renders the :index template" do
      get :index ,params:{plan_id: plan.id}
      expect(response).to render_template :index
    end
  end


end
