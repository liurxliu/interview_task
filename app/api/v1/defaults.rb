module V1
  module Defaults
    extend ActiveSupport::Concern

    included do
      use ActionDispatch::Session::CookieStore, key: "_#{Rails.application.class.parent.name.underscore}_session"

      format :json
      version 'v1', using: :path

      helpers do
        def current_user
          if session[:user_id]
            @current_user ||= User.find(session[:user_id])
          else
            @current_user = nil
          end
        end

        def session
          env['rack.session']
        end
      end
    end
  end
end

