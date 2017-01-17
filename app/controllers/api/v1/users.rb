module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      resource :users do

        # params do
        #   requires :token, type: String, desc: 'Access token.'
        # end

        desc 'Return all users'
        get '', root: :users do
          #authenticate!
          User.all
        end

        desc 'Return a user'
        params do
          requires :id, type: String, desc: 'ID of the user'
          #requires :token, type: String, desc: 'Access token.'
        end
        get ':id', root: 'user' do
          #authenticate!
          User.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end