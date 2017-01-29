class Admin::FranchisesController < ApplicationController
  require 'net/http'
  require 'json'

  before_filter :authenticate_user!
  layout 'admin'
  before_action :set_admin_franchise, only: [:show, :edit, :update, :destroy]


  def index
    @franchises = Franchise.paginate(:page => params[:page])
  end


  def show
  end

  def new
    @franchises = Franchise.new
  end


  def edit
  end

  def search
    if request.post?
      search_address
    end
  end

  def create
    @franchise = Franchise.new(admin_franchise_params)

    respond_to do |format|
      if @franchise.save
        format.html { redirect_to admin_franchises_path, notice: 'FranchiseLocation was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @franchise.update(admin_franchise_params)
        format.html { redirect_to admin_franchise__path, notice: 'FranchiseLocation was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @franchise.destroy
    respond_to do |format|
      format.html { redirect_to admin_franchise_path, notice: 'FranchiseLocation was successfully destroyed.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_franchise
    @franchise = FranchiseLocation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_franchise_params
    params.require(:franchise).permit(:name, :factual_id, :rank, )
  end
end

