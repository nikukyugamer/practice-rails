require 'rails_helper'

RSpec.describe 'Healthcheck', type: :request do
  describe 'GET /index' do
    it '期待通りのレスポンスが返ってくること' do
      get healthcheck_path
      expect(response).to have_http_status(:ok)

      response_to_hash = JSON.parse(response.body)
      expect(response_to_hash).to eq({ 'status' => 'ok' })
    end
  end
end
