class PunditerController < ApplicationController
  def index
    @sony_cat = PunditerPolicy::Scope.new(current_user, Punditer).resolve
  end
end
