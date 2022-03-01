class MattressesController < ApplicationController
  before_action :set_mattress, only: %i[ show edit update destroy ]

  # GET /mattresses or /mattresses.json
  def index
    @mattresses = Mattress.includes(:shop)

  end

  # GET /mattresses/1 or /mattresses/1.json
  def show
  end

  # GET /mattresses/new
  def new
    @shop = Shop.find(params[:shop_id])
    @mattress = Mattress.new
  end

  # GET /mattresses/1/edit
  def edit
    @mattress = Mattress.find(params[:id]).includes(:shop)
    @shop = @mattress.shop
  end

  # POST /mattresses or /mattresses.json
  def create
    @shop = Shop.find(params[:shop_id])
    @mattress = @shop.mattresses.new(mattress_params)
    @mattress.shop = @shop


    if @mattress.save
      redirect_to shop_mattresses_path(@mattress)
    else
      redirect_to root_path
    end

  end

  # PATCH/PUT /mattresses/1 or /mattresses/1.json
  def update
    respond_to do |format|
      if @mattress.update(mattress_params)
        format.html { redirect_to mattress_url(@mattress), notice: "Mattress was successfully updated." }
        format.json { render :show, status: :ok, location: @mattress }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mattress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mattresses/1 or /mattresses/1.json
  def destroy
    @mattress.destroy

    respond_to do |format|
      format.html { redirect_to mattresses_url, notice: "Mattress was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mattress
      @mattress = Mattress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mattress_params
      params.require(:mattress).permit(:shop_id, :mattress_name)
    end
end
