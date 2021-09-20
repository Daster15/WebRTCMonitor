class CrudhistoryactionsController < ApplicationController
  before_action :set_crudhistoryaction, only: %i[ show edit update destroy ]

  # GET /crudhistoryactions or /crudhistoryactions.json
  def index
    @crudhistoryactions = Crudhistoryaction.history
    
    render json: @crudhistoryactions
    
    #render json: @crudhistoryactions.collect{|b| b.attributes_with_following_flag()}
  end

  # GET /crudhistoryactions/1 or /crudhistoryactions/1.json
  def show
  end

  # GET /crudhistoryactions/new
  def new
    @crudhistoryaction = Crudhistoryaction.new
  end

  # GET /crudhistoryactions/1/edit
  def edit
  end

  # POST /crudhistoryactions or /crudhistoryactions.json
  def create
    @crudhistoryaction = Crudhistoryaction.new(crudhistoryaction_params)

    respond_to do |format|
      if @crudhistoryaction.save
        format.html { redirect_to @crudhistoryaction, notice: "Crudhistoryaction was successfully created." }
        format.json { render :show, status: :created, location: @crudhistoryaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @crudhistoryaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crudhistoryactions/1 or /crudhistoryactions/1.json
  def update
    respond_to do |format|
      if @crudhistoryaction.update(crudhistoryaction_params)
        format.html { redirect_to @crudhistoryaction, notice: "Crudhistoryaction was successfully updated." }
        format.json { render :show, status: :ok, location: @crudhistoryaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crudhistoryaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crudhistoryactions/1 or /crudhistoryactions/1.json
  def destroy
    @crudhistoryaction.destroy
    respond_to do |format|
      format.html { redirect_to crudhistoryactions_url, notice: "Crudhistoryaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def attributes_with_following_flag()
    as_json.merge({is_following: 'test'})
end
    # Use callbacks to share common setup or constraints between actions.
    def set_crudhistoryaction
      @crudhistoryaction = Crudhistoryaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def crudhistoryaction_params
      params.fetch(:crudhistoryaction, {})
     # params.require(:product).permit(:title, :price)
    end
end
