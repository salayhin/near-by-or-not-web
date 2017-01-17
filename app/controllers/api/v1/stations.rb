module API
  module V1
    class Stations < Grape::API
      include API::V1::Defaults

      resource :stations do

        # params do
        #   requires :token, type: String, desc: 'Access token.'
        # end

        desc 'Return all fuel stations'
        get '', root: :stations do
          #authenticate!
          FuelStation.all
        end

        desc 'Station Last Update Time'

        get '/last_update_time', root: :stations do
          StationUpdateInfo.order(:id).last!
        end

        desc 'Return a fuel station'
        params do
          requires :id, type: String, desc: 'ID of the fuel station'
          #requires :token, type: String, desc: 'Access token.'
        end

        get ':id', root: 'station' do
          #authenticate!
          FuelStation.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end