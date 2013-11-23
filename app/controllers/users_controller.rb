class UsersController < ApplicationController
  before_action :get_user, except: [ :index, :create]
  respond_to :json
  
  def index

    @users = params[:id] ? User.includes( :comments ).where('id in (?)', params[:id].split(",")) : User.includes( :comments ).all
    
  end
  
  def create
    if user = User.create(user_params)
      head :created, location: user_url(user)
    else
      head :unprocessable_entity
    end
  end
  
  def update
    if @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @user.destroy
    head :no_content
  end

  private

  def get_user
    head :not_found unless @user = User.includes( :comments ).find_by_id( params[:id] ) 
  end

  def user_params
    params.require(:name, :email, :is_admin)
  end

end

