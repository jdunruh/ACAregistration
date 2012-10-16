class RiderRegistrationsController < ApplicationController

  before_filter :check_race_event_selected

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
    @entries = Entry.where(:rider_registration_id => @rider_registration.id)
    @rider = Rider.find(@rider_registration.rider_id )

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rider_registration }
    end
  end

  # GET /rider_registrations/new
  # GET /rider_registrations/new.json
  def new
    @rider_registration = RiderRegistration.new
    @races = Race.where("race_event_id = ?", session[:race_event])[0]

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
    @rider_registration = RiderRegistration.new
    @rider_registration.rider_id = session[:rider]
    p = params[:rider_registration][:entry_ids]
    p  ||= []
    entries=p.reject {|e| e.empty?}
    RiderRegistration.transaction do
      entries.each do |i|
        e = Entry.new(:rider_registration_id => @rider_registration.id, :race_id => i, :number => Race.find(i).next_rider_number)
        e.save!
      end

      respond_to do |format|
        if @rider_registration.save
          format.html { redirect_to @rider_registration, notice: 'Rider registered.' }
          format.json { render json: @rider_registration, status: :created, location: @rider_registration }
        else
          format.html { render action: "new" }
          format.json { render json: @rider_registration.errors, status: :unprocessable_entity }
        end
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
     races = Race.where("race_event_id = ?", session[:race_event])
     rider = Rider.where("license_number = ?", params[:license_number])
     if rider.length == 0
       flash[:notice] = "License number #{params[:license_number]} not found"
       respond_to do |format|
         format.html { render "rider_registrations/find"}
         format.json { render json: nil }
       end
     end
     @rider = rider[0]
     session[:rider] = @rider.id
     @aca = AcaDatum.where("usac_number = ?", @rider.license_number)
     @races = races.select do |r|
       r.race_eligible?(@rider)
     end


     respond_to do |format|
       format.html # new.html.erb
       format.json { render json: @rider_registration }
     end
   end

  def new_rider_by_name
     @rider_registration = RiderRegistration.new
     @races = Race.where("race_event_id = ?", session[:race_event])
     if params["last_name"].length > 0
       if params["first_name"].length == 0
         @rider = Rider.where("last_name = ?", params[:last_name])
       else
         @rider = Rider.where("last_name = ? and first_name = ?", params[:last_name], params[:first_name])
       end
     else
       flash[:notice] = "Must supply last name for search"
       @rider = []
     end

     if @rider.length > 1
       respond_to do |format|
         format.html
         format.json { render json: @rider_registration }
       end
     elsif @rider.length == 1
       @rider = @rider[0]
       respond_to do |format|
         format.html { render "new_rider.html.erb" }
         format.json { render json: @rider_registration }
       end
     else
       flash[:notice] = "No riders named #{params[:first_name]} #{params[:last_name]} found."
       render :find
     end
  end

  protected
  def check_race_event_selected
    redirect_to "/race_events/select" unless session[:race_event]
  end

end