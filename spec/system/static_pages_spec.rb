require 'rails_helper'
require 'open3'

RSpec.describe '静的ページ', type: :system do
  before :all do
    kill_process_command = %(kill `ps ax | grep "h[t]tp-server public/ -p 4000" | awk '{print $1}'`)
    `#{kill_process_command}` # プロセスが存在しない場合でもここで実行は止まらない

    `npx http-server public/ -p 4000 > /tmp/http-server_on_spec.log 2>&1 &`
    wait_command = <<~COMMAND
      until : > /dev/tcp/localhost/4000; do
        echo -n .
        sleep 1
      done
    COMMAND
    Open3.capture3(wait_command)

    sleep 10
  end

  after :all do
    kill_process_command = %(kill `ps ax | grep "h[t]tp-server public/ -p 4000" | awk '{print $1}'`)
    `#{kill_process_command}` # プロセスが存在しない場合でもここで実行は止まらない
  end

  it '404.html へアクセスすると期待通りのレスポンスが返ってくること' do
    visit 'http://localhost:4000/404.html'

    expect(page.current_url).to eq 'http://localhost:4000/404.html'
    expect(page).to have_content 'You may have mistyped the address or the page may have moved.'
    expect(page).to have_content 'ページが見つかりません。'

    save_screenshot
  end

  it '422.html へアクセスすると期待通りのレスポンスが返ってくること' do
    visit 'http://localhost:4000/422.html'

    expect(page.current_url).to eq 'http://localhost:4000/422.html'
    expect(page).to have_content "Maybe you tried to change something you didn't have access to."
    expect(page).to have_content '正しく処理できませんでした。'

    save_screenshot
  end

  it '500.html へアクセスすると期待通りのレスポンスが返ってくること' do
    visit 'http://localhost:4000/500.html'

    expect(page.current_url).to eq 'http://localhost:4000/500.html'
    expect(page).to have_content 'If you are the application owner check the logs for more information.'
    expect(page).to have_content 'サーバーエラーです。'

    save_screenshot
  end
end
