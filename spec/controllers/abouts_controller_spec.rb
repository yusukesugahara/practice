require 'rails_helper'

describe AboutsController do

  let(:user) { create(:user) }

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
