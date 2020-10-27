class EurekodsController < ApplicationController
  
  def index
    @eurekods = Eurekod.all
  end
  
  def show
    @eurekod = Eurekod.find(params[:id])
  end
  
  def new
    @eurekod = Eurekod.new
  end
  
  def create
    @eurekod = Eurekod.new(eurekod_params)

    if @eurekod.save
      redirect_to eurekod_path(@eurekod),  notice: 'Tuto was successfully created.'   
    else
      render :new
    end
  end
  
  def edit
    @eurekod = Eurekod.find(params[:id])
  end
  
  def update
    @eurekod = Eurekod.find(params[:id])
    if @eurekod.update(eurekod_params)
      redirect_to @eurekod, notice: 'Tuto was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @eurekod = Eurekod.find(params[:id])
    @eurekod.destroy
      redirect_to eurekods_path, notice: 'Tuto was successfully destroyed.'
    
  end
  
  private
    def eurekod_params
      params.require(:eurekod).permit(:name, :description, :url)
    end
  
  
end
