class Admin::TranslationsController < ApplicationController
  before_filter :find_locale
  
  def find_locale
    @locale = Locale.find(params[:locale_id])
  end
  
  def index
    translations = @locale.translations.find :all, :order => "namespace, id"
    @groups = translations.group_by(&:namespace)
  end

  def show
    @translation = Translation.find(params[:id])
  end

  def new
    @translation = Translation.new
  end

  def edit
    @translation = Translation.find(params[:id])
  end

  def create
    @translation = Translation.new(params[:translation])

    respond_to do |format|
      if @translation.save
        flash[:notice] = 'Translation was successfully created.'
        format.html { redirect_to(admin_translations_url) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @translation = Translation.find(params[:id])

    respond_to do |format|
      if @translation.update_attributes(params[:translation])
        flash[:notice] = 'Translation was successfully updated.'
        format.html { redirect_to(admin_translation_url(@translation)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @translation = Translation.find(params[:id])
    @translation.destroy

    respond_to do |format|
      format.html { redirect_to(admin_translations_url) }
    end
  end
end
