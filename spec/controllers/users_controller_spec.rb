require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }
  describe 'GET #show' do
    it "renders the :new template" do
    get :show,params:{id: 1}
    expect(response).to render_template :show
    end
  end

end
