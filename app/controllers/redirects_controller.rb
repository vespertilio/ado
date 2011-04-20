class RedirectsController < ApplicationController
  def create
    #raise params.inspect
    Redirect.create(params[:redirect])
    Card.create(:message_id => params[:redirect][:message_id], :status => "Письмо направлено для исполнения #{Agent.find(params[:redirect][:agent_id]).sname}" )
    redirect_to(:controller => :messages, :action => :show, :id => params[:redirect][:message_id])
    
  end
end
