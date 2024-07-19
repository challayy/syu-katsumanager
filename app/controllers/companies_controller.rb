class CompaniesController < ApplicationController
    before_action :set_company, only: [:show, :edit, :update, :destroy]
    
    def index
        @companies = if params[:filter].present?
                        Company.where(status: params[:filter])
                    else
                        Company.all
                    end
    
        @companies = case params[:sort]
                    when 'created_at'
                        @companies.order(created_at: :asc)
                    when 'schedule'
                        @companies.order(schedule: :asc)
                    else
                        @companies
                    end
    end
    
    def new
        @company = Company.new
    end
    
    def create
        @company = Company.new(company_params)
        @company.user_id = current_user.id
        if @company.save
        redirect_to @company, notice: 'Company was successfully created.'
        else
        flash[:alert] = @company.errors.full_messages.join(', ')
        render :new
        end
    end
    
    def edit
        @company = Company.find(params[:id])
    end
    
    def update
        @company = Company.find(params[:id])
        if @company.update(company_params)
        redirect_to @company, notice: 'Company was successfully updated.'
        else
        render :edit
        end
    end
    
    def destroy
        @company.destroy
        redirect_to companies_url, notice: 'Company was successfully destroyed.'
    end
    
    def show
    end
    
    def calendar
        @companies = Company.all
            start_date = params.fetch(:start_date, Date.today).to_date
            @companies = Company.where(schedule: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    end
    
    private
    
    def set_company
        @company = Company.find(params[:id])
    end
    
    def company_params
        params.require(:company).permit(:name, :industry, :status, :url, :id_copy, :password, :schedule, :notes, :user_id)
    end
end