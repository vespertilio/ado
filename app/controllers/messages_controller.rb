class MessagesController < ApplicationController
  
  # GET /messages
  # GET /messages.xml
  def index
    
    session[:year] = session[:status] = session[:search] = nil if params[:filter] == '0'
    
    params[:year] ? session[:year] = params[:year] : session[:year] = Date.today.year.to_s
    params[:status] ? session[:status] = params[:status] : 'incomplete' 
    params[:search] ? session[:search] = params[:search] : '' 
    exp = params[:search]
        
    # raise session[:search].inspect 
    #raise search.inspect
    
    @h1 = "Входящие#{
    if session[:status] == 'incomplete'
      ', не завершенные,'
    elsif session[:status] == 'complete'
      ', завершенные,'
    else
      ''
    end
    } письма за #{session[:year] ? session[:year] + ' год.' : 'все года'}"
    
      
    cond = 'TRUE '
    
    # Подбор поиска по году для SQL    
    session[:year] ? year = "01-01-#{session[:year]}".to_date : year = nil
    year ? cond += "and (created_at > '#{year}' and created_at < '#{year + 1.year}')" : false 
    
    # Подбор поиска по статусу письма для SQL
    case session[:status]
      when 'incomplete' then  cond += "and complited IS NULL"
      when 'complete' then  cond += "and complited IS NOT NULL"      
    end
        
    # Подбор поиска по статусу письма для ActiveRecord
    cs = case session[:status]
    when 'incomplete' then nil
    when 'complete' then 1
    else nil
    end
    
    
    # Подбор поиска по params[:search] 
    if (/\! .*/.match(exp)) == 0 
      search = "= '#{(/\! .*/.match(exp)).to_s[2..-1]}'"
      cond += " and (subject #{search} or int_number #{search} or number #{search})" 
    elsif exp != nil 
      search = "LIKE '%#{exp}%'"
      cond += " and (subject #{search} or int_number #{search} or number #{search})"
    end
    
    @search = search
    (/\! .*/.match(exp)).to_s[2..-1] ? search = "= '#{(/\! .*/.match(exp)).to_s[2..-1]}'" : search = "LIKE '%#{exp}%'"
    
    @years = Message.first.created_at.year..Message.last.created_at.year
    
    #Сбор сообщений по параметрам фильтрации
    @messages = []
    @messages += Message.find(:all, 
                              :conditions => cond, 
                              :order => "number desc", 
                              :include => [:agent, :org, :cards,:redirects])
          
    
    if params[:search]
    
      for a in Agent.find(:all, :conditions => "name #{search}", :include => [:redirects])
        for m in a.messages          
          @messages.push m if m.complited == cs #and m.created_at > (year ? year : Message.first.created_at - 1.day) and (m.created_at < (year ? year + 1.year : Message.last.created_at + 1.day))
        end
        for b in a.redirects
          @messages.push b.message
        end
        
      end
      
      #Org.find(:all, :conditions => "name #{search}").each {|i| @messages.push i.messages}
    end
      
    @counts = []
    @counts.push Message.count(:all, :conditions => "complited is NULL")
    @counts.push Message.count(:all, :conditions => "complited = 1")
    @np = 1
    @np = nil if params[:print]
    
    @messages.sort!{|a,b| b.number <=> a.number}
    @messages = @messages.paginate(:per_page => 10, :page => params[:page])
    #raise @messages.inspect
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
      format.json {render :json => @messages}
    end
  end

  def complete
    m = Message.find(params[:id])
    m.complited = 1
    c = m.cards.new
    c.status = "Работы по письму успешно завершены."
    c.save
    m.save
    flash[:notice] = "Работы по письму успешно завершены."
    respond_to do |format|
        format.html { redirect_to(messages_url) }
        format.xml  { head :ok }
    end
  end
  
  def redirect
    m = Message.find(params[:message])
    u = Agent.find(params[:user])
    card = Card.new
    card.status = "Письмо передано в работу #{u.sname}."
    card.save
    m.executor_id = u.id
    m.save
    redirect_to(message_url)
  end
  
  
  # GET /messages/1
  # GET /messages/1.xml
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
      
    end
  end

  # GET /messages/new
  # GET /messages/new.xml
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])   
  end
  
  # POST /messages
  # POST /messages.xml
  def create
    #raise params.inspect
    if params[:message][:agent_name] 
      agent = Agent.find_or_create_by_name(params[:message][:agent_name])
      org = Org.find_or_create_by_name(params[:message][:agent_org]) if params[:message][:agent_org]
      
      @message = Message.new
      @message.subject = params[:message][:subject]
      @message.int_number = params[:message][:int_number].to_s
      @message.number = params[:message][:number]
      @message.agent = agent
      
      agent.position = params[:message][:agent_position]
      org.agents << agent
      agent.save
      @message.org_id = org.id if org
      org.save    
    end
    
    
    
    respond_to do |format|
      if @message.save
        if params[:message][:upload]
          uploaded_io = params[:message][:upload]
          File.open(Rails.root.join('public', 'uploads', "message.#{@message.id}.pdf"), 'wb') do |file| file.write(uploaded_io.read) end
        end
        flash[:notice] = 'Письмо успешно зарегистрировано.'
        format.html { redirect_to(messages_url)}
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.xml
  
  def show_org
    @agent = Agent.find(:first, :conditions => "name = '#{params[:id]}'")
    #raise @agent.inspect
  end
  
  def mfu
    @message = Message.find(params[:id])     
  end
  
  def forward
    @message = Message.find(params[:id])
  end
  
  def update
    @message = Message.find(params[:id])
    if params[:message][:agent_name]
      agent = Agent.find_or_create_by_name(params[:message][:agent_name])
      org = Org.find_or_create_by_name(params[:message][:agent_org]) if params[:message][:agent_org]
      
      #@message.created_at = params[:message][:created_at]
      @message.subject = params[:message][:subject]
      @message.int_number = params[:message][:int_number].to_s
      @message.number = params[:message][:number]
      @message.agent = agent
      
      agent.position = params[:message][:agent_position]
      org.agents << agent
      agent.save
      @message.org_id = org.id if org
      org.save    
    end
    
    
    
    respond_to do |format|
      if @message.save
        if params[:message][:upload]
          uploaded_io = params[:message][:upload]
          File.open(Rails.root.join('public', 'uploads', "message.#{@message.id}.pdf"), 'wb') do |file| file.write(uploaded_io.read) end
      end
        flash[:notice] = 'Реквизиты изменены.'
        format.html { redirect_to(messages_url)}
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to(messages_url) }
      format.xml  { head :ok }
    end
  end
end
