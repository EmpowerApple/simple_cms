class SectionsController < ApplicationController
  layout 'admin'
  
  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  
  def index
    list
    render('list')
  end
  
  def list
    @sections = Section.order("sections.position ASC")
  end
  
  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:name => 'default')
    @section_count = Section.count + 1
  end
  
  def create
    @section = Section.new(params[:section])
    if @section.save
      flash[:notice] = "Section created"
      redirect_to(:action => 'list')
    else
      @section_count = Section.count + 1
      render('new')
    end 
  end

  def edit
     @section = Section.find(params[:id])
     @section_count = Section.count
  end
      
  def update
    @section = Section.find(params[:id])
     
    if @section.update_attributes(params[:section])
      flash[:notice] = "Section updated"
      redirect_to(:action => 'show', :id => @section.id)
    else
      @section_count = Section.count
      render('edit')
    end  
  end
  
  def delete
    @section = Section.find(params[:id])
  end
  
  def destroy
    Section.find(params[:id]).destroy
    flash[:notice] = "Section destroyed"
    redirect_to(:action => 'list')
  end  
end
