class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end



  def create
    company_params = params.require(:company).permit(:title, :description)
    @company = Company.new company_params
    # @user = User.new user_params

    if @company.save
      current_user.company_id = @company.id
      redirect_to edit_user_path(current_user) #we will need to update the current_user's company_id with this company id - so we will render a page that will do just that
        # if @user.save
        #   session[:user_id] = @user.id
        #   if @user.seniority_status == 1
        #     redirect_to new_user_path
        #   else
        #     render plain: "please make sure to have a supervisor seniority status in order to create or edit users"
        #   end
        # else 
        #   # render :new
        #   render plain: "there is an error: company not created"
        # end      
    else
      render plain: "company not created: something is wrong"

      # current_user.update_attribute(:company_id, @company.id) #the first user will not be associated with the company, therefore, this association will be passed on here after saving
      # render plain: "company created and company_id assigned to current user"

    end

  end

  def show
    @company = Company.find params[:id]
  end

  def index
    @companies = Company.all
  end

  def edit
    @company = Company.find params[:id]
  end


  def update
    @company = Company.find params[:id]
    @company.update company_params
    redirect_to company_path(@company)
  end

  def destroy
  end

  private

  def company_params
    params.require(:company).permit(:title, :description, :is_status_active)
  end

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
      :skill_description,
      :password,
      :password_confirmation
    )    
  end
  
end

