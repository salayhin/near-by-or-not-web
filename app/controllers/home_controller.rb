class HomeController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'

  def index

  end
end


#rails g model FuelStation name:string latitude:float longitude:float address:text phone_number:string comments:text color_code:string is_active:boolean
