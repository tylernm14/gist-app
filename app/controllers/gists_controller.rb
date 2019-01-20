class GistsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_gist, only: [:show, :edit, :update, :destroy]

  # GET /gists
  def index
    @gists = Gist.all
  end

  def show
    @comments = if params[:comment]
                  @gist.comments.where(id: params[:comment])
                else
                  @gist.comments.where(parent_id: nil)
                end
    # @comments = @comments.page(params[:page]).per(5)
  end

  def new
    @gist = Gist.new
    @gist.g_files.build
    @short_url = @gist.build_short_url
  end

  def edit
  end

  def create
    @gist = Gist.new(gist_params)
    respond_to do |format|
      if @gist.save
        format.html { redirect_to @gist, notice: 'Gist was successfully created.' }
        format.json { render action: 'show', status: :created, location: @gist }
      else
        format.html { render action: 'new' }
        format.json { render json: @gist.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @test.update(gist_params)
        format.html { redirect_to @gist, notice: 'Gist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @gist.destroy
    respond_to do |format|
      format.html { redirect_to gists_url }
      format.json { head :no_content }
    end
  end

  private
    def set_gist
      @gist = Gist.find(params[:id])
    end

    def gist_params
      params.require(:gist).permit([:user_id, :description, :short_url_attributes => [:value], :g_files_attributes => [:filename, :contents]])
    end
end
