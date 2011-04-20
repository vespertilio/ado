class CardsController < ApplicationController
  # GET /cards
  # GET /cards.xml
  def index
      @cards = Card.all
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cards }
    end
  end

  def new
    @card = Card.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @card }
    end
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
  end

   def create

    @card = Card.new
    @card.status = params[:card][:status]
    @card.message_id = params[:card][:message_id]
    
    if @card.save
        if params[:card][:upload]
          uploaded_io = params[:card][:upload]
          @card.file = uploaded_io.original_filename
          @card.save
          File.open(Rails.root.join('public', 'uploads\\cards\\', "card.#{@card.message_id}.#{@card.id}.#{uploaded_io.original_filename.split(/\./)[-1]}"), 'wb') do |file| file.write(uploaded_io.read) end
          
        end
        respond_to do |format|
        format.html { redirect_to(@card.message)}
        format.xml  { render :xml => @card, :status => :created, :location => @card }
      end
    end
  end

  # PUT /cards/1
  # PUT /cards/1.xml
  def update
    @card = Card.find(params[:id])

    respond_to do |format|
      if @card.update_attributes(params[:card])
        flash[:notice] = 'Card was successfully updated.'
        format.html { redirect_to(@card) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.xml
  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
end
