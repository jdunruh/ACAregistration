class RidersController < ApplicationController
  # GET /riders
  # GET /riders.json
  def index
    @riders = Rider.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @riders }
    end
  end

  # GET /riders/1
  # GET /riders/1.json
  def show
    @rider = Rider.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rider }
    end
  end

  # GET /riders/new
  # GET /riders/new.json
  def new
    @rider = Rider.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rider }
    end
  end

  # GET /riders/1/edit
  def edit
    @rider = Rider.find(params[:id])
  end

  # POST /riders
  # POST /riders.json
  def create
    @rider = Rider.new(params[:rider])

    respond_to do |format|
      if @rider.save
        format.html { redirect_to @rider, notice: 'Rider was successfully created.' }
        format.json { render json: @rider, status: :created, location: @rider }
      else
        format.html { render action: "new" }
        format.json { render json: @rider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /riders/1
  # PUT /riders/1.json
  def update
    @rider = Rider.find(params[:id])

    respond_to do |format|
      if @rider.update_attributes(params[:rider])
        format.html { redirect_to @rider, notice: 'Rider was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /riders/1
  # DELETE /riders/1.json
  def destroy
    @rider = Rider.find(params[:id])
    @rider.destroy

    respond_to do |format|
      format.html { redirect_to riders_url }
      format.json { head :no_content }
    end
  end

  def upload_file
    respond_to do |format|
      format.html
      format.json { head :no_content }
    end
  end


  def upload
    Rider.delete_all # clear existing contents
    # raise params[:rider_database][:file].tempfile.inspect
    n=0
    CSV.foreach(params[:rider_database][:file].tempfile, :headers => true)  do |row|
      c=Rider.new
      c.suspended = row["suspended"] ? false : true
      c.license_number = row["license#"].to_i
      c.last_name  = row["last name"]
      c.first_name = row["first name"]
      c.city = row["city"]
      c.state = row["state"]
      c.female = row["gender"] == "F" ? true : false
      c.racing_age = row["racing age"]
      c.exp_date = row["exp date"]
      c.rd_club = row["Rdclub"]
      c.rd_team = row["Rdteam"]
      c.track_club = row["Trackcub"]
      c.track_team = row["Trackteam"]
      c.cx_club = row["Cxclub"]
      c.cx_team = row["Cxteam"]
      c.intl_team = row["IntlTeam"]
      c.ncca_club = row["NCCA Club"]
      c.road_cat = row["Road Cat"].to_i
      c.track_cat = row["TrackCat"].to_i
      c.cross_cat = row["Cross Cat"].to_i
      c.birthdate = row["birthdate"]
      c.citizen = row["citizen"] == "Y" ? true : false
      c.emergency_contact = row["emergency contact"]
      c.e_contact_phone = row["e-contact phone"]
      c.oneday = false
      if c.save
         n=n+1
         GC.start if n%50==0
      end
    end
    flash.now[:message]="CSV Import Successful,  #{n} new records added to data base"
  end

  def new_one_day
    @rider = Rider.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rider }
    end
  end

  def create_one_day
    @rider = Rider.new(params[:rider])
    @rider.suspended = false
    @rider.license_number = 0
    @rider.exp_date = Date.today
    @rider.rd_club = "Unattached"
    @rider.rd_team = "Unattached"
    @rider.track_club = "Unattached"
    @rider.track_team = "Unattached"
    @rider.cx_club = "Unattached"
    @rider.cx_team = "Unattached"
    @rider.intl_team = "Unattached"
    @rider.ncca_club = "Unattached"
    @rider.read_cat = @rider.female ? 4 : 5  # Cat 5 is only for men
    @rider.track_cat = 4
    @rider.cross_cat = 4
    @rider.oneday = true


    respond_to do |format|
      if @rider.save
        format.html { redirect_to @rider, notice: 'Rider was successfully created.' }
        format.json { render json: @rider, status: :created, location: @rider }
      else
        format.html { render action: "new" }
        format.json { render json: @rider.errors, status: :unprocessable_entity }
      end
    end

  end
end

