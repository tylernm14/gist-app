class GFilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_g_file, only: [:show, :edit, :update, :destroy]

  # GET /g_files
  # GET /g_files.json
  def index
    @g_files = GFile.all
  end

  # GET /g_files/1
  # GET /g_files/1.json
  def show
  end

  # GET /g_files/new
  def new
    @g_file = GFile.new
  end

  # GET /g_files/1/edit
  def edit
  end

  # POST /g_files
  # POST /g_files.json
  def create
    @g_file = GFile.new(g_file_params)

    respond_to do |format|
      if @g_file.save
        format.html { redirect_to @g_file, notice: 'G file was successfully created.' }
        format.json { render :show, status: :created, location: @g_file }
      else
        format.html { render :new }
        format.json { render json: @g_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /g_files/1
  # PATCH/PUT /g_files/1.json
  def update
    respond_to do |format|
      if @g_file.update(g_file_params)
        format.html { redirect_to @g_file, notice: 'G file was successfully updated.' }
        format.json { render :show, status: :ok, location: @g_file }
      else
        format.html { render :edit }
        format.json { render json: @g_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /g_files/1
  # DELETE /g_files/1.json
  def destroy
    @g_file.destroy
    respond_to do |format|
      format.html { redirect_to g_files_url, notice: 'G file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_g_file
      @g_file = GFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def g_file_params
      params.require(:g_file).permit(:filename, :contents, :gist_id)
    end
end
