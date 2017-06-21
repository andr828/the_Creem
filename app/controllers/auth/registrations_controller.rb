class Auth::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper

  respond_to :json

  rescue_from ActiveRecord::SubclassNotFound do |exception|
    render json: exception, status: 422
  end

  # PUT /auth/users
  def update
    super do |resource|
      Rails.logger.info "LOG registrations#update: #{resource.inspect}"
    end
  end

  # POST /auth/users
  def create
    super do |resource|
      if resource.persisted? && (resource.entity && resource.entity.persisted?)
        # TODO: better way to build nested_attributes response?
        resp = resource.attributes.slice(*user_attrs).merge(entity: resource.entity.attributes.slice(*entity_attrs))
        return render json: resp
      end
    end
  end

  # DELETE /auth/users
  def destroy
    super do |resource|
      Rails.logger.info "LOG registrations#destroy: #{resource.inspect}"
    end
  end

  private

  def sign_up_params
    allow = [:email, :password, :password_confirmation, [entity_attributes: [:first_name, :last_name, :business_name, :type]]]
    user = params.require(resource_name).permit(allow)
    # Camelize :type for Entity STI.
    user[:entity_attributes][:type] = (user[:entity_attributes][:type] || '').camelize
    user
  end

  def user_attrs
    %w(id email created_at updated_at)
  end

  def entity_attrs
    %w(id type first_name last_name business_name metadata created_at updated_at)
  end

end
