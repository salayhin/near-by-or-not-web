module API
  module V1
    class Cities < Grape::API
      include API::V1::Defaults

      resource :cities do

        # params do
        #   requires :token, type: String, desc: 'Access token.'
        # end

        desc 'Return all us cities'
        get '', root: :cities do
          #authenticate!
          UsaCity.all.limit(5)
        end

        desc 'Return a city'
        params do
          requires :id, type: String, desc: 'ID of the fuel station'
          #requires :token, type: String, desc: 'Access token.'
        end

        get ':id', root: 'city' do
          #authenticate!
          UsaCity.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end