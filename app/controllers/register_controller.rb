class RegisterController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to register_url, alert: "Try again later." }

  def new
  end

  def create
    user = User.new(params.permit(:email_address, :password))
    if user.save
      start_new_session_for user
      redirect_to home_url
    else
      redirect_to register_url, alert: "There was a problem creating your account."
    end
  end
end
