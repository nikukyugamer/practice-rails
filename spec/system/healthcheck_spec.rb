require 'rails_helper'

RSpec.describe '/healthcheck', type: :system do
  it '期待通りのレスポンスが返ってくること' do
    visit healthcheck_path

    expect(page).to have_current_path(healthcheck_path)
    expect(page).to have_content '{"status":"ok"}'
  end
end
