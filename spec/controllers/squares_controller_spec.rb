require 'rails_helper'

describe SquaresController do
  let(:user) { create(:user) }
  let(:square) { create(:square,user_id: user.id)}


  describe 'GET #new' do
    before do
      login_user user
    end
    it "renders the :new template" do
    get :new
    expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before do
      login_user user
    end
    it "renders the :edit template" do
    get :edit, params:{id: square.id}
    expect(response).to render_template :edit
    end
  end

  describe 'GET #show' do
    before do
      login_user user
    end
    it "renders the :show template" do
    get :show,params:{id: square.id}
    expect(response).to render_template :show
    end
  end

end
