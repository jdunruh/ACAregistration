class AcaDataController < ApplicationController
  # GET /aca_data
  # GET /aca_data.json
  def index
    @aca_data = AcaDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aca_data }
    end
  end

  # GET /aca_data/1
  # GET /aca_data/1.json
  def show
    @aca_datum = AcaDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aca_datum }
    end
  end

  # GET /aca_data/new
  # GET /aca_data/new.json
  def new
    @aca_datum = AcaDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aca_datum }
    end
  end

  # GET /aca_data/1/edit
  def edit
    @aca_datum = AcaDatum.find(params[:id])
  end

  # POST /aca_data
  # POST /aca_data.json
  def create
    @aca_datum = AcaDatum.new(params[:aca_datum])

    respond_to do |format|
      if @aca_datum.save
        format.html { redirect_to @aca_datum, notice: 'Aca datum was successfully created.' }
        format.json { render json: @aca_datum, status: :created, location: @aca_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @aca_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aca_data/1
  # PUT /aca_data/1.json
  def update
    @aca_datum = AcaDatum.find(params[:id])

    respond_to do |format|
      if @aca_datum.update_attributes(params[:aca_datum])
        format.html { redirect_to @aca_datum, notice: 'Aca datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aca_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aca_data/1
  # DELETE /aca_data/1.json
  def destroy
    @aca_datum = AcaDatum.find(params[:id])
    @aca_datum.destroy

    respond_to do |format|
      format.html { redirect_to aca_data_url }
      format.json { head :no_content }
    end
  end

  def upload
     AcaDatum.delete_all # clear existing contents
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

end
