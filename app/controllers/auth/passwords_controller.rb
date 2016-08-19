class Auth::PasswordsController < Devise::PasswordsController
  include ApplicationHelper

  respond_to :json

  # TODO: learn more about what these actions do, looks like it's to
  #       do with reset password functionality (which is currently,
  #       broken).

  def new
    super do |resource|
      Rails.logger.info "LOG passwords#new: #{resource.inspect}"

    end
  end

  def create
    super do |resource|
      Rails.logger.info "LOG passwords#create: #{resource.inspect}"
    end
  end

  def edit
    super do |resource|
      Rails.logger.info "LOG passwords#edit: #{resource.inspect}"
    end
  end

  def update
    super do |resource|
      Rails.logger.info "LOG passwords#update: #{resource.inspect}"
    end
  end
end
