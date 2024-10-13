class PasswordResetsController < ApplicationController
  before_action :redirect_if_signed_in

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user.present?
      redirect_to root_path, notice: "Email sent with password reset instructions"
    else
      flash.now[:notice] = "No user found with that email address"

      render :new, status: :unprocessable_entity
    end
  end
end
