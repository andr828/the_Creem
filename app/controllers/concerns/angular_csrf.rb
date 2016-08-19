# This module allow Angular to works well with Rails CSRF protection
# It's intended for AngularJS app served outside of the Rails asset pipeline.
module AngularCSRF
  extend ActiveSupport::Concern

  included do
    # Prevent CSRF attacks by raising an exception.
    protect_from_forgery with: :exception
    after_filter :set_csrf_cookie_for_ng

    # Clean up cookies on InvalidAuthenticityRequest
    rescue_from ActionController::InvalidAuthenticityToken do |exception|
      cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
      message = 'Rails CSRF token error, please try again'
      render_with_protection(message.to_json, {:status => :unprocessable_entity})
    end

    protected

    def set_csrf_cookie_for_ng
      cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
    end

    def verified_request?
      super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
    end

    # JSON / JSONP XSS protection
    def render_with_protection(object, parameters = {})
      render parameters.merge(content_type: 'application/json', text: ")]}',\n" + object.to_json)
    end
  end

end