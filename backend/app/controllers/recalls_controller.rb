class RecallsController < ApplicationController
  before_action :set_recall, only: [:show, :edit, :update, :destroy]

  # GET /recalls
  # GET /recalls.json
  def index
    @recalls = Recall.all
  end

  # GET /recalls/1
  # GET /recalls/1.json
  def show
  end

  # GET /recalls/new
  def new
    @recall = Recall.new
  end
  
  # GET /recalls/upload
  # for batch upload recalls through json.
  def upload
    data = params[:json_data]
		recalls = JSON.parse(data)
		recalls.each do |recall|
			@recall = Recall.find_by_id(recall['id'])
			if @recall.nil?
				@recall = Recall.create(:id => recall['id'], :product_id => recall['product_id'], :reason => recall['reason'], :level_id => recall['level_id'], :region_id => recall['region_id'], :contact_id => recall['contact_id'], :date => recall['date'])
			end
		end
		
    respond_to do |format|
      format.html { redirect_to :controller => 'recalls', :action => 'index' }
    end
    
  end
  
  # GET /recalls/search?upc_code=...
  def search
    if params.include?(:upc_code)
      @upc_code = params[:upc_code]
      @recalls = Recall.recalls_by_upc_code(params[:upc_code])
      @json = { :recalls => @recalls.as_json }
    else
      @json = { :recalls => [] }
    end
    
    respond_to do |format|
        format.html { render :index, status: :ok }
        format.json { render json:  @json }
    end
  end

  # GET /recalls/1/edit
  def edit
  end

  # POST /recalls
  # POST /recalls.json
  def create
    @recall = Recall.new(recall_params)

    respond_to do |format|
      if @recall.save
        format.html { redirect_to @recall, notice: 'Recall was successfully created.' }
        format.json { render :show, status: :created, location: @recall }
      else
        format.html { render :new }
        format.json { render json: @recall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recalls/1
  # PATCH/PUT /recalls/1.json
  def update
    respond_to do |format|
      if @recall.update(recall_params)
        format.html { redirect_to @recall, notice: 'Recall was successfully updated.' }
        format.json { render :show, status: :ok, location: @recall }
      else
        format.html { render :edit }
        format.json { render json: @recall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recalls/1
  # DELETE /recalls/1.json
  def destroy
    @recall.destroy
    respond_to do |format|
      format.html { redirect_to recalls_url, notice: 'Recall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recall
      @recall = Recall.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recall_params
      params.require(:recall).permit(:product_id, :reason, :level_id, :region_id, :contact_id, :date)
    end
end
