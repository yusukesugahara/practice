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

  describe 'GET #show' do
    before do
      login_user user
    end
    it "renders the :show template" do
      get :show ,params: {id: user}
      expect(response).to render_template :show
    end
  end
end
