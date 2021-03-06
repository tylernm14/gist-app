class ShortUrlsController < ApplicationController

  # before_action :authenticate_user!, except: [:index, :show]
  before_action :set_short_url, only: [:edit, :update, :destroy]

  def index
    @short_urls = ShortUrl.all
  end

  def show
    @short_url = ShortUrl.find_by_value(params[:short_url]) or not_found
    redirect_to polymorphic_url(@short_url.shortenable)
  end

  def edit
  end

  def create
    @short_url = ShortUrl.new(short_url_params)
    respond_to do |format|
      if @short_url.save
        format.html { redirect_to @short_url, notice: 'ShortUrl was successfully created.' }
        format.json { render action: 'show', status: :created, location: @short_url }
      else
        format.html { 400 }
        format.json { render json: @short_url.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @short_url.update(short_url_params)
        format.html { redirect_to @short_url, notice: 'Short url was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @short_url.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @short_url.destroy
    respond_to do |format|
      format.html { redirect_to short_urls_url }
      format.json { head :no_content }
    end
  end


  private

    def set_short_url
      @short_url = ShortUrl.find(params[:id])
    end

    def short_url_params
      params.require(:short_url).permit([:value])
    end

end