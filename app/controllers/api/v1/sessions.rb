module API
  module V1
    class Sessions < Grape::API
      include API::V1::Defaults

      resource :sessions do

        desc 'Check user login'
        params do
          requires :phone_number, type: String, desc: 'Email of the user'
        end
        get '/login', root: 'user' do
          #authenticate!
          user = User.where(phone_number: permitted_params[:phone_number])
          if user.present?
            status 200
            {is_valid_user: true}
          else
            status 200
            {is_valid_user: false}
          end
        end

      end
    end
  end
end