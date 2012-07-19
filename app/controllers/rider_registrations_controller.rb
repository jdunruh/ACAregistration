class RiderRegistrationsController < ApplicationController
  # GET /rider_registrations
  # GET /rider_registrations.json
  def index
    @rider_registrations = RiderRegistration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rider_registrations }
    end
  end

  # GET /rider_registrations/1
  # GET /rider_registrations/1.json
  def show
    @rider_registration = RiderRegistration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rider_registration }
    end
  end

  # GET /rider_registrations/new
  # GET /rider_registrations/new.json
  def new
    @rider_registration = RiderRegistration.new
    @races = Race.where(race_event_id = session[:race_event])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rider_registration }
    end
  end

  # GET /rider_registrations/1/edit
  def edit
    @rider_registration = RiderRegistration.find(params[:id])
  end

  # POST /rider_registrations
  # POST /rider_registrations.json
  def create
    @rider_registration = RiderRegistration.new(params[:rider_registration])

    respond_to do |format|
      if @rider_registration.save
        format.html { redirect_to @rider_registration, notice: 'Rider registration was successfully created.' }
        format.json { render json: @rider_registration, status: :created, location: @rider_registration }
      else
        format.html { render action: "new" }
        format.json { render json: @rider_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rider_registrations/1
  # PUT /rider_registrations/1.json
  def update
    @rider_registration = RiderRegistration.find(params[:id])

    respond_to do |format|
      if @rider_registration.update_attributes(params[:rider_registration])
        format.html { redirect_to @rider_registration, notice: 'Rider registration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rider_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rider_registrations/1
  # DELETE /rider_registrations/1.json
  def destroy
    @rider_registration = RiderRegistration.find(params[:id])
    @rider_registration.destroy

    respond_to do |format|
      format.html { redirect_to rider_registrations_url }
      format.json { head :no_content }
    end
  end

  def new_rider
     @rider_registration = RiderRegistration.new
     @races = Race.where("race_event_id = ?", session[:race_event])
     rider = Rider.where("license_number = ?", params[:license_number])
     @rider = rider[0]

     respond_to do |format|
       format.html # new.html.erb
       format.json { render json: @rider_registration }
     end
   end

end
