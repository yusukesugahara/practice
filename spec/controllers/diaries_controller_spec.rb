require 'rails_helper'

describe DiariesController do

  let(:group) { create(:group) }
  let(:user) { create(:user) }
  let(:user_group) { create(:user_group, user_id: user.id, group_id: group.id) }
  let(:plan) { create(:plan,group_id: group.id)}
  let(:diary) { create(:diary,group_id: group.id)}

  describe 'GET #index' do
    before do
      login_user user
    end
    it "renders the :index template" do
      get :index ,params:{plan_id: plan.id}
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before do
      login_user user
    end
    it "renders the :new template" do
      get :new ,params:{plan_id: plan.id}
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before do
      login_user user
    end
    it "renders the :edit template" do
      get :edit, params:{id: plan.id, group_id: group.id}
      expect(response).to render_template :edit
    end
  end

  describe 'GET #show' do
    before do
      login_user user
    end
    it "renders the :show template" do
      get :show,params:{id: plan.id, group_id: group.id}
      expect(response).to render_template :show
    end
  end

end
