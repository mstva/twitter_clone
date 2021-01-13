class TwitsController < ApplicationController
  before_action :set_twit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /twits
  # GET /twits.json
  def index
    @twits = Twit.all.order("created_at DESC")
  end

  # GET /twits/1
  # GET /twits/1.json
  def show
  end

  # GET /twits/new
  def new
    @twit = current_user.twits.build
  end

  # GET /twits/1/edit
  def edit
  end

  # POST /twits
  # POST /twits.json
  def create
    @twit = current_user.twits.build(twit_params)

    respond_to do |format|
      if @twit.save
        format.html { redirect_to root_path, notice: 'Twit was successfully created.' }
        format.json { render :show, status: :created, location: @twit }
      else
        format.html { render :new }
        format.json { render json: @twit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twits/1
  # PATCH/PUT /twits/1.json
  def update
    respond_to do |format|
      if @twit.update(twit_params)
        format.html { redirect_to root_path, notice: 'Twit was successfully updated.' }
        format.json { render :show, status: :ok, location: @twit }
      else
        format.html { render :edit }
        format.json { render json: @twit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twits/1
  # DELETE /twits/1.json
  def destroy
    @twit.destroy
    respond_to do |format|
      format.html { redirect_to twits_url, notice: 'Twit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twit
      @twit = Twit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def twit_params
      params.require(:twit).permit(:body, :user_id)
    end
end
