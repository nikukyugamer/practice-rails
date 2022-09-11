require 'rails_helper'
require "open3"

RSpec.describe '静的ページ', type: :system do
  before do
    kill_process_command = %(kill `ps ax | grep "p[h]p -S localhost:4000 -t public/" | awk '{print $1}'`)
    `#{kill_process_command}` # プロセスが存在しない場合でもここで実行は止まらない

    `/usr/bin/env php -S localhost:4000 -t public/ > /tmp/php_httpd_on_rspec.log 2>&1 &`
    sleep 5
  end

  after do
    kill_process_command = %(kill `ps ax | grep "p[h]p -S localhost:4000 -t public/" | awk '{print $1}'`)
    `#{kill_process_command}` # プロセスが存在しない場合でもここで実行は止まらない
  end

  it '期待通りのレスポンスが返ってくること' do
    visit 'http://localhost:4000/422.html'

    expect(page.current_url).to eq 'http://localhost:4000/422.html'
    expect(page).to have_content "Maybe you tried to change something you didn't have access to."
  end
end
