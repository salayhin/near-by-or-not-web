module API
  module V1
    class Searches < Grape::API
      include API::V1::Defaults

      resource :search do

        params do
          requires :key, type: String, desc: 'Sate-City name'
        end

        desc 'Search for city'
        get '/city/:key', root: 'search' do
          #authenticate!

          city_name = ''
          state_name = ''
          param = permitted_params[:key]

          if param.include? ','
            split_param = param.split(',')

            if split_param.length > 1
              city_name = split_param[0].strip.downcase
              state_name = split_param[1].strip.downcase
            elsif split_param.length == 1
              city_name = split_param[0].strip.downcase
              state_name = split_param[0].strip.downcase
            end
          else
            city_name = param.strip.downcase
            state_name = param.strip.downcase
          end

          city_details = UsaCity.where('lower(name) = ? AND lower(state) = ?', city_name, state_name)

          if city_details.length > 0
            city_details[0]
          else
            status 200
            { message: 'Not Found!'}

          end
        end

      end
    end
  end
end