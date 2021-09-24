class PluginsController < ApplicationController
  before_action :set_plugin, only: %i[ show edit update destroy ]
  helper_method :sort_column, :sort_direction

  # GET /plugins or /plugins.json
  def index
    @pagy, @plugins  = pagy(Plugin.where(call_type: 'incoming').order(sort_column + " " + sort_direction))
  end

  # GET /plugins/1 or /plugins/1.json
  def show
    @get_call_id = @plugin.id 
    @sip_id_message = Plugin.select(:id,:call_id).where(id: @plugin.id).first
    @connection_id = @sip_id_message.call_id
    @hangup_time = Plugin.where(call_type: "hangup", call_id: @plugin.call_id).first
    @time = @hangup_time.timestamp
  end

  # GET /plugins/new
  def new
    @plugin = Plugin.new
  end

  # GET /plugins/1/edit
  def edit
  end

  # POST /plugins or /plugins.json
  def create
    @plugin = Plugin.new(plugin_params)

    respond_to do |format|
      if @plugin.save
        format.html { redirect_to @plugin, notice: "Plugin was successfully created." }
        format.json { render :show, status: :created, location: @plugin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plugin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plugins/1 or /plugins/1.json
  def update
    respond_to do |format|
      if @plugin.update(plugin_params)
        format.html { redirect_to @plugin, notice: "Plugin was successfully updated." }
        format.json { render :show, status: :ok, location: @plugin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plugin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plugins/1 or /plugins/1.json
  def destroy
    @plugin.destroy
    respond_to do |format|
      format.html { redirect_to plugins_url, notice: "Plugin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plugin
      @plugin = Plugin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plugin_params
      params.fetch(:plugin, {})
    end

    def find_hangup_time(call_id)
      hangup_time = Plugin.where(call_type: "hangup", call_id: call_id).first
      return hangup_time
    end

    def sort_column
      Plugin.column_names.include?(params[:sort]) ? params[:sort] : "timestamp"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
