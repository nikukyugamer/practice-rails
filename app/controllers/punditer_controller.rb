class PunditerController < ApplicationController
  def index
    authorize Punditer
  end
end
