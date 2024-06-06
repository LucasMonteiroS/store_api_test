require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe 'GET /index' do
    context 'quando há categorias cadastradas' do
      it 'retorna uma lista de categorias' do
        category1 = Category.create(description: 'Categoria 01')
        category2 = Category.create(description: 'Categoria 02')

        get '/categories'

        expect(response).to have_http_status(:ok)
        expect(response.body).to include(category1.to_json)
        expect(response.body).to include(category2.to_json)
      end
    end

    context 'quando não há categorias cadastradas' do
      it 'retorna uma lista vazia' do
        get '/categories'
        expect(JSON.parse(response.body)).to eq([])
      end
    end
  end

  describe 'GET /show' do
    context 'quando a categoria existe' do
      it 'retorna uma categoria especifica' do
        category = Category.create(description: 'Alimentos')
        get "/categories/#{category.id}"

        expect(response).to have_http_status(:ok)
        expect(response.body).to eq(category.to_json)
      end

      it 'quando não encontra a categoria' do
        expect do
          get '/categories/999999'
          expect(response).to have_http_status(:not_found)
        end
      end
    end
  end

  describe 'POST /create' do
    context 'quando os parâmetros são válidos' do
      it 'cria uma nova categoria' do
        post '/categories', params: category_params = { category: { description: 'Alimentos' } }

        expect(response).to have_http_status(:created)
      end
    end

    context 'quando os parâmetros são inválidos' do
      it 'retorna um erro de unprocessable entity' do
        post '/categories', params: category_params = { category: { description: nil } }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
