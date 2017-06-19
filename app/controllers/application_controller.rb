class ApplicationController < ActionController::Base

  include AngularCSRF

  private

  #-> Prelang (user_login:devise)
  def require_user_signed_in
    unless user_signed_in?

      # If the user came from a page, we can send them back.  Otherwise, send
      # them to the root path.
      if request.env['HTTP_REFERER']
        fallback_redirect = :back
      elsif defined?(root_path)
        fallback_redirect = root_path
      else
        fallback_redirect = "/"
      end

      redirect_to fallback_redirect, flash: {error: "You must be signed in to view this page."}
    end
  end

  def log_headers
    http_envs = {}.tap do |envs|
      request.headers.each do |key, value|
        envs[key] = value if key.downcase.starts_with?('http')
      end
    end

    Rails.logger.info "LOG Received #{request.method.inspect} to #{request.url.inspect} from #{request.remote_ip.inspect}. Processing with headers #{http_envs.inspect} and params #{params.inspect}"
  end

  def log_response
    Rails.logger.info "LOG Responding with #{response.status.inspect} => #{response.body.inspect}"
  end

  def log_response
    Rails.logger.info "LOG Responding with #{response.status.inspect} => #{response.body.inspect}"
  end

end
