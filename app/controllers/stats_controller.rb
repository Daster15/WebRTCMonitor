class StatsController < ApplicationController
  before_action :set_stat, only: %i[ show edit update destroy ]
  helper_method :sort_column, :sort_direction

  # GET /stats or /stats.json
  def index
   # @stats = Stat.all
    @pagy, @stats  = pagy(Stat.order(sort_column + " " + sort_direction))
   # collection = Stat.select("handle").distinct
   # @pagy, @stats = pagy(collection)
    #@stats  = Stat.select(:id,:handle).order(sort_column + " " + sort_direction).group(:handle)
  end


  def completed_tasks
    #'created_at > ? AND created_at < ?', Date.today + 12.hours, Date.today + 16.5.hours
    render json: Stat.where(handle: params[:handle]) 
  end

  def completed_tasks_range
    render json: Stat.where('handle = ? AND timestamp >= ? AND timestamp <= ? ',params[:handle],params[:time_start], params[:time_stop]) 
  end

  def load_sip_params
    render json: Plugin.where('handle = ? AND timestamp >= ? AND timestamp <= ? ',params[:handle],params[:time_start], params[:time_stop]) 
  end

  def load_sdp_params
    render json: Sdp.where('handle = ? AND timestamp >= ? AND timestamp <= ? ',params[:handle],params[:time_start], params[:time_stop]) 
  end

 

  # POST /stats or /stats.json
  def create
    @stat = Stat.new(stat_params)

    respond_to do |format|
      if @stat.save
        format.html { redirect_to @stat, notice: "Stat was successfully created." }
        format.json { render :show, status: :created, location: @stat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stat
      @stat = Stat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stat_params
      params.fetch(:stat, {})
    end
  
    def sort_column
      Stat.column_names.include?(params[:sort]) ? params[:sort] : "handle"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
