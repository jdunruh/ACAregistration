class RaceEventsController < ApplicationController
  # GET /race_events
  # GET /race_events.json
  def index
    @race_events = RaceEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @race_events }
    end
  end

  # GET /race_events/1
  # GET /race_events/1.json
  def show
    @race_event = RaceEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @race_event }
    end
  end

  # GET /race_events/new
  # GET /race_events/new.json
  def new
    @race_event = RaceEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @race_event }
    end
  end

  # GET /race_events/1/edit
  def edit
    @race_event = RaceEvent.find(params[:id])
  end

  # POST /race_events
  # POST /race_events.json
  def create
    @race_event = RaceEvent.new(params[:race_event])

    respond_to do |format|
      if @race_event.save
        format.html { redirect_to @race_event, notice: 'Race event was successfully created.' }
        format.json { render json: @race_event, status: :created, location: @race_event }
      else
        format.html { render action: "new" }
        format.json { render json: @race_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /race_events/1
  # PUT /race_events/1.json
  def update
    @race_event = RaceEvent.find(params[:id])

    respond_to do |format|
      if @race_event.update_attributes(params[:race_event])
        format.html { redirect_to @race_event, notice: 'Race event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @race_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /race_events/1
  # DELETE /race_events/1.json
  def destroy
    @race_event = RaceEvent.find(params[:id])
    @race_event.destroy

    respond_to do |format|
      format.html { redirect_to race_events_url }
      format.json { head :no_content }
    end
  end
end
