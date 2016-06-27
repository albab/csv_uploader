class AddressesController < ApplicationController
  def index
    @addresses = Address.all.paginate(:per_page => 10, :page => params[:page])
    @address = Address.new
  end

  def create
    Address.all.destroy_all
    @import = Address.import(params[:file])
    if @import.empty?
      flash[:success] = "Successfully Imported Addresses!"
    else
      flash[:error] = "Oops! " + @import[0]
    end
    redirect_to root_path
  end
end
