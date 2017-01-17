module API
  module V1
    class Auth < Grape::API
      include API::V1::Defaults

      resource :auth do

        desc 'Creates and returns access_token if valid login'
        params do
          requires :phone_number, type: String, desc: 'Phone Number'
          optional :access_token, type: String, desc: 'Access Token'
          optional :user_id, type: Integer, desc: 'User ID'
          optional :is_active, type: Boolean, desc: 'Is Active'
          optional :expires_at, type: DateTime, desc: 'Expires At'
        end

        post :login do

          # if params[:login].include?('@')
          #   user = User.find_by_phone_number(params[:login].downcase)
          # else
          #   user = User.find_by_login(params[:login].downcase)
          # end

          user = User.find_by_phone_number(params[:phone_number].downcase)

          if user #&& user.authenticate(params[:password])
            key = ApiKey.create(user_id: user.id)
            {token: key.access_token}
          else
            error!('Unauthorized.', 401)
          end
        end

        desc 'Returns pong if logged in correctly'
        params do
          requires :token, type: String, desc: 'Access token.'
        end
        get :ping do
          authenticate!
          { message: 'pong' }
        end
      end
    end
  end
end


