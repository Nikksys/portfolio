class HomeController < ApplicationController
  
  def index
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      redirect_to root_path, notice: 'Message sent successfully'
    else
      flash.now[:error] = 'Cannot send message'
      render :index
    end
  end
  
  def portfolio
    @all_projects = (Project.all + Design.all).sort_by {|i| i.ref_date}.reverse
    
  end
  
  def about_me
    
  end
  
  def new
    @contact = Contact.new
  end
  
  
  
end