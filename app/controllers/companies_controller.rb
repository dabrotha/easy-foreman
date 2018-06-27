class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    company_params = params.require(:company).permit(:title, :description)
    Company.create company_params
    # render text: "Company Created Successfuly"
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

end

