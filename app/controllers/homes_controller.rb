class HomesController < ApplicationController
  def index
    
  end

  def new
    
  end

  def create
    cookies.signed[:username] = params[:home][:username]
    redirect_to "/homes/show"
  end

  def show
    @onlines = Remos::Online.new('sst:online').index
  end
end