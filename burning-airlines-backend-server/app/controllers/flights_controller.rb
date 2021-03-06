class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  # GET /flights
  # GET /flights.json
  def index
    @flights = Flight.all
    @flights_sorted = Flight.all.sort_by { |f| f.date }
    @flights_sorted_rev = @flights_sorted.reverse
  end

  # Get /flights/search/:origin/:destination
  def filtered_index 
    puts "The current :origin #{params[:origin]} and the current :destination #{params[:destination]}"

    @flights = Flight.find_by(origin: params[:origin], destination: params[:destination] ) # I think I need to make either of these search values optional. 
    
    render :json => @flights.to_json(:include => :reservations )
  end
  
  # GET /flights/1
  # GET /flights/1.json
  def show
    headers['Access-Control-Allow-Origin'] = '*'

    
    render :json => @flight.to_json(:include => :reservations )
  end
  
  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights
  # POST /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: 'Flight was successfully created.' }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1
  # PATCH/PUT /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: 'Flight was successfully updated.' }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url, notice: 'Flight was successfully burned.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flight_params
      params.require(:flight).permit(:number, :origin, :destination, :date, :plane_id)
    end
end