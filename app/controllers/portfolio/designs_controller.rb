class Portfolio::DesignsController < ApplicationController
  before_action :set_auth, except: %i[ index show ]
  def index
    @designs = (user_signed_in? && current_user.role == 'admin') ? Design.all.order(ref_date: :desc) : Design.published.all.order(ref_date: :desc)
  end
  
  def show
    @design = Design.find(params[:id])
  end
  
  def new
    @design = Design.new
  end
  
  def create
    @design = Design.new(design_params)
    
    if @design.save
        redirect_to [:portfolio, @design], notice: 'Design was successfully created.'   
    else
        render :new 
    end
  end
  
  def edit
    @design = Design.find(params[:id])
  end
  
  def update
    @design = Design.find(params[:id])
    if @design.update(design_params)
        redirect_to [:portfolio, @design], notice: 'Design was successfully updated.' 
    else
        render :edit 
    end    
  end
  
  def destroy
    @design = Design.find(params[:id])
    @design.destroy
      redirect_to portfolio_designs_path, notice: 'Project was successfully destroyed.' 
  end
  
  private
    
    def design_params
      params.require(:design).permit(:name, :description, :design_type, :picture, :content, :remove_picture, :ref_date, :online)
    end
    
    def set_auth
      redirect_to( "/") unless user_signed_in? && current_user.role == 'admin'
    end
  
end