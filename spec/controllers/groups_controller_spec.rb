require 'rails_helper'

describe GroupsController do
  let(:user) { create(:user) }

  describe 'GET #new' do
    before do
      login_user user
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  let(:group) {create(:group)}

  describe 'GET #edit' do
    before do
      login_user user
    end
    it "renders the :edit template" do
      get :edit, params: {id: group.id}
      expect(response).to render_template :edit
    end
  end


  describe 'GET #show' do
    before do
      login_user user
    end
    it "renders the :show template" do
      get :show ,params: {id: group.id}
      expect(response).to render_template :show
    end
  end
end
