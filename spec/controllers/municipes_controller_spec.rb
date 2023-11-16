require 'rails_helper'

RSpec.describe MunicipesController, type: :controller do
  describe 'Municipe Controller' do
    context '#index' do
      it 'Filter Controller' do
        email_busca = 'email@email.com'

        create(:municipe, email: email_busca)
        get :index, params: { municipe: { busca: email_busca } }
        municipes = @controller.instance_variable_get(:@municipes)
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
        expect(municipes.size).to eq 1
      end
    end
  end
end
