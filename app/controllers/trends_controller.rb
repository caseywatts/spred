class TrendsController < ApplicationController
  # GET /trends
  # GET /trends.json
  def index
    @trends = Trend.all
    @friendsphones = User.first.friends.map {|f| f.phone}
    @sickfriends = User.find_all_by_phone(@friendsphones)

    @allsickfriendentries = Array.new

    @weekago = Time.now - 1.week
    @sickfriends.each do |f|
      f.entries.each do |e|
       @allsickfriendentries << e if e.entrytime >= @weekago
      end
    end

    #@weekago = Time.now - 1.week
    #@relevantentries = Entry.find(:all, :conditions => ['entrytime >= ? and ', @weekago])
    #@union = @relevantentries | @sickfriends.entries


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trends }
    end
  end

  # GET /trends/1
  # GET /trends/1.json
  def show
    @trend = Trend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trend }
    end
  end

  # GET /trends/new
  # GET /trends/new.json
  def new
    @trend = Trend.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trend }
    end
  end

  # GET /trends/1/edit
  def edit
    @trend = Trend.find(params[:id])
  end

  # POST /trends
  # POST /trends.json
  def create
    @trend = Trend.new(params[:trend])

    respond_to do |format|
      if @trend.save
        format.html { redirect_to @trend, notice: 'Trend was successfully created.' }
        format.json { render json: @trend, status: :created, location: @trend }
      else
        format.html { render action: "new" }
        format.json { render json: @trend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trends/1
  # PUT /trends/1.json
  def update
    @trend = Trend.find(params[:id])

    respond_to do |format|
      if @trend.update_attributes(params[:trend])
        format.html { redirect_to @trend, notice: 'Trend was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @trend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trends/1
  # DELETE /trends/1.json
  def destroy
    @trend = Trend.find(params[:id])
    @trend.destroy

    respond_to do |format|
      format.html { redirect_to trends_url }
      format.json { head :ok }
    end
  end
end
