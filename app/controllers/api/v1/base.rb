require 'grape-swagger'

module API
  module V1
    class Base < Grape::API
      mount API::V1::Auth
      mount API::V1::Stations
      mount API::V1::Users
      mount API::V1::Cities
      mount API::V1::Searches
      mount API::V1::Sessions

      # add_swagger_documentation(
      #     api_version: 'v1',
      #     hide_documentation_path: true,
      #     mount_path: '/api/v1/swagger_doc',
      #     hide_format: true
      # )

      # helpers do
      #   def authenticate!
      #     error!('Unauthorized. Invalid or expired token.', 401) unless current_user
      #   end
      #
      #   def current_user
      #     # find token. Check if valid.
      #     token = ApiKey.where(access_token: params[:token]).first
      #     if token && !token.expired?
      #       @current_user = User.find(token.user_id)
      #     else
      #       false
      #     end
      #   end
      # end



    end

  end
end