class Admin::LocalesController < ApplicationController
  def index
    @locales = Locale.find :all, :order => "iso"
  end

  def show
    @locale = Locale.find(params[:id])
  end

  def new
    @locale = Locale.new
  end

  def edit
    @locale = Locale.find(params[:id])
  end

  def create
    @locale = Locale.new(params[:locale])

    respond_to do |format|
      if @locale.save
        flash[:notice] = 'Locale was successfully created.'
        format.html { redirect_to(admin_locales_url) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @locale = Locale.find(params[:id])

    respond_to do |format|
      if @locale.update_attributes(params[:locale])
        flash[:notice] = 'Locale was successfully updated.'
        format.html { redirect_to(admin_locale_url(@locale)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @locale = Locale.find(params[:id])
    @locale.destroy

    respond_to do |format|
      format.html { redirect_to(admin_locales_url) }
    end
  end
end
