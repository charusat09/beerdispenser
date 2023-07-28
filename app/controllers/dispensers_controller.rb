class DispensersController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_dispenser, only: %i[ show edit update destroy ]

  # GET /dispensers or /dispensers.json
  def index
    @dispensers = Dispenser.all
  end

  # GET /dispensers/1 or /dispensers/1.json
  def show
  end

  # GET /dispensers/new
  def new
    @dispenser = Dispenser.new
  end

  # GET /dispensers/1/edit
  def edit
  end

  # POST /dispensers or /dispensers.json
  def create
    @dispenser = Dispenser.new(dispenser_params)

    respond_to do |format|
      if @dispenser.save
        format.html { redirect_to dispenser_url(@dispenser), notice: "Dispenser was successfully created." }
        format.json { render :show, status: :created, location: @dispenser }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dispenser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dispensers/1 or /dispensers/1.json
  def update
    if dispenser_params[:status] == 'open'
      @dispenser.last_opened_at = Time.now
    elsif dispenser_params[:status] == 'closed'
      @dispenser.last_closed_at = Time.now
    end

    respond_to do |format|
      if @dispenser.update(dispenser_params)
        format.html { redirect_to @dispenser, notice: 'Dispenser was successfully updated.' }
        format.json { render :show, status: :ok, location: @dispenser }
      else
        format.html { render :edit }
        format.json { render json: @dispenser.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # DELETE /dispensers/1 or /dispensers/1.json
  def destroy
    @dispenser.destroy

    respond_to do |format|
      format.html { redirect_to dispensers_url, notice: "Dispenser was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispenser
      @dispenser = Dispenser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dispenser_params
      params.require(:dispenser).permit(:flow_volume, :status, :last_opened_at, :last_closed_at, :total_revenue, :price_per_liter)
    end
end
