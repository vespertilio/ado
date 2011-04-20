class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.xml
  def index
    @orders = Order.all(:order => "number desc")
    
    @order = Order.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
      
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    
    param = params[:order].to_hash
    @order = Order.new
    @order.number = param["number"]
    @order.intnumber = param["intnumber"]
    @order.desc = param["desc"]
    @order.date = "#{
    if param["date(3i)"].to_i < 10
      "0" + param["date(3i)"]
    else
      param["date(3i)"]
    end
    }.#{
    if param["date(2i)"].to_i < 10
      "0" + param["date(2i)"]
    else
      param["date(2i)"]
    end
    }.#{param["date(1i)"]}"
    @order.save

    respond_to do |format|
      if @order.save
        flash[:notice] = 'Приказ успешно зарегистрирован.'
        format.html { redirect_to(orders_url) }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        flash[:notice] = 'Изменения внесены.'
        format.html { redirect_to(@order) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end
end
