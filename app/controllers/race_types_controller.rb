class RaceTypesController < ApplicationController
  # GET /race_types
  # GET /race_types.json
  def index
    @race_types = RaceType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @race_types }
    end
  end

  # GET /race_types/1
  # GET /race_types/1.json
  def show
    @race_type = RaceType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @race_type }
    end
  end

  # GET /race_types/new
  # GET /race_types/new.json
  def new
    @race_type = RaceType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @race_type }
    end
  end

  # GET /race_types/1/edit
  def edit
    @race_type = RaceType.find(params[:id])
  end

  # POST /race_types
  # POST /race_types.json
  def create
    @race_type = RaceType.new(params[:race_type])

    respond_to do |format|
      if @race_type.save
        format.html { redirect_to @race_type, notice: 'Race type was successfully created.' }
        format.json { render json: @race_type, status: :created, location: @race_type }
      else
        format.html { render action: "new" }
        format.json { render json: @race_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /race_types/1
  # PUT /race_types/1.json
  def update
    @race_type = RaceType.find(params[:id])

    respond_to do |format|
      if @race_type.update_attributes(params[:race_type])
        format.html { redirect_to @race_type, notice: 'Race type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @race_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /race_types/1
  # DELETE /race_types/1.json
  def destroy
    @race_type = RaceType.find(params[:id])
    @race_type.destroy

    respond_to do |format|
      format.html { redirect_to race_types_url }
      format.json { head :no_content }
    end
  end
end
