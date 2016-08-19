class Auth::SessionsController < Devise::SessionsController
  include ApplicationHelper

  respond_to :json

  # POST /auth/users/sign_in
  def create
    super do |resource|
      Rails.logger.info "LOG sessions#create: #{resource.inspect}"
    end
  end

  # DELETE /auth/users/sign_out
  def destroy
    super do |resource|
      Rails.logger.info "LOG sessions#destroy: #{resource.inspect}"
    end
  end
end
