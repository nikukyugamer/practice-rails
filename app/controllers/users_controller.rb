class UsersController < ApplicationController
  def index
  end

  def create
    user = User.new(user_params)
    user.save!
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :age,
      :height,
      :weight,
      :foobar
    )
  end
end
