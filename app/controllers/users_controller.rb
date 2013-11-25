class UsersController < ApplicationController
  before_action :get_user, except: [ :index, :create]
  respond_to :json
  
  def index

    @users = params[:id] ? User.includes( :comments ).where('id in (?)', params[:id].split(",")) : User.includes( :comments ).all
    
  end
  
  def create

    if user.save
      head :created, location: user_url(user)
    else
      head :unprocessable_entity
    end
  end
  
  def update
    user = User.where('id = ?', params[:id]).take
    
    if user
      if user.update(user_params)
        head :reser_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end
  
  def destroy
    user = User.where('id = ?', params[:id]).take

    if user 
      if user.destroy
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end

  end

  private

  def get_user
    head :not_found unless @user = User.includes( :comments ).find_by_id( params[:id] ) 
  end

  def user_params
    params.require(:user).permit(
      :name, 
      :email, 
      :is_admin
    )
  end

end

