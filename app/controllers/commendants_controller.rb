class CommendantsController < ApplicationController
  # GET /commendants
  # GET /commendants.xml
  def index
    @commendants = Commendant.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @commendants }
    end
  end

  # GET /commendants/1
  # GET /commendants/1.xml
  def show
    @commendant = Commendant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @commendant }
    end
  end

  # GET /commendants/new
  # GET /commendants/new.xml
  def new
    @commendant = Commendant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @commendant }
    end
  end

  # GET /commendants/1/edit
  def edit
    @commendant = Commendant.find(params[:id])
  end

  # POST /commendants
  # POST /commendants.xml
  def create
    @commendant = Commendant.new(params[:commendant])

    respond_to do |format|
      if @commendant.save
        flash[:notice] = 'Commendant was successfully created.'
        format.html { redirect_to(@commendant) }
        format.xml  { render :xml => @commendant, :status => :created, :location => @commendant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @commendant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /commendants/1
  # PUT /commendants/1.xml
  def update
    @commendant = Commendant.find(params[:id])

    respond_to do |format|
      if @commendant.update_attributes(params[:commendant])
        flash[:notice] = 'Commendant was successfully updated.'
        format.html { redirect_to(@commendant) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @commendant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /commendants/1
  # DELETE /commendants/1.xml
  def destroy
    @commendant = Commendant.find(params[:id])
    @commendant.destroy

    respond_to do |format|
      format.html { redirect_to(commendants_url) }
      format.xml  { head :ok }
    end
  end
end
