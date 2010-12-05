class ProfileController < ApplicationController
  def show
    @user = User.find(params[:id])
    @updates = @user.updates.all
  end

end
