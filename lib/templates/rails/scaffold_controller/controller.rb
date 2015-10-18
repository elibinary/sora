# coding: UTF-8
class <%= controller_class_name %>Controller < AdminController
  before_action :set_<%= file_name %>, only: [:show, :edit, :update, :destroy]
  
  def index
    @<%= plural_file_name %> = <%= file_name.camelize %>.all

    @<%= plural_file_name %> = @<%= plural_file_name %>.page(params[:page])
  end

  def show
    
  end
  
  def new
    @<%= file_name %> = <%= orm_class.build(file_name.camelize) %>
  end
  
  def edit
    @per_page = params[:page]
    @q = params[:q].present? ? params[:q][:name] : nil
  end
  
  def create
    @<%= file_name %> = <%= file_name.camelize %>.new(<%= file_name %>_params)

    if @<%= file_name %>.save
      redirect_to admin_<%= plural_file_name %>_url(page: params[:page], q: params[:q]), notice: 'Create Success'
    else
      render :action => "new"
    end
  end
  
  def update
    if @<%= file_name %>.update_attributes(<%= file_name %>_params)
      redirect_to admin_<%= plural_file_name %>_url(page: params[:page], q: params[:q]), notice: 'Update Success'
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @<%= file_name %>.destroy

    redirect_to(<%= index_helper %>_path,:notice => 'Delete Success')
  end

private

  def set_<%= file_name %>
    @<%= file_name %> = <%= orm_class.find(file_name.camelize, "params[:id]") %>
  end

  def <%= file_name %>_params
    params.require(:<%= file_name %>).permit(:arrt)
  end
end