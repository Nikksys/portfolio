class Portfolio::DesignsController < ApplicationController
  
  def index
    @designs = Design.all
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
      params.require(:design).permit(:name, :description, :design_type, :picture, :content)
    end
  
end