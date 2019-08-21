class HomeController < ApplicationController
  def index
    @check_me = ENV.fetch 'FOO', 'default_value'
    ENV['DEBUG'] = 'Hello, Ruby on Rails World!'
  end
end
