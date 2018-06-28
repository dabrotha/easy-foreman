class UsersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
      if @user.save #this is where the user actually saves - standard way in rails
        session[:user_id] = @user.id
        render plain: "User created successfuly"
      else 
        render :new
        render plain: "User not created"
      end
    # company_params = params.require(:company).permit(:title, :description)
    # Company.create company_params
    # # render text: "Company Created Successfuly"
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update
    render plain: "User updated"
    else
      render plain: "User not updated"
    end
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find params[:id]
  end


  def update
    @user = User.find params[:id]
    @user.update user_params
    # redirect_to user_path(@user)
  end
  
  private
  def user_params
    params.require(:user).permit(
      :last_name,
      :first_name,
      :email,
      :phone,
      :address_street,
      :address_street_number,
      :address_unit_number,
      :address_city,
      :address_postal_code,
      :activity_status,
      :seniority_status,
      :employment_status,
      :wage,
      :job_title,
      :skill_description
    )    
  end

end

