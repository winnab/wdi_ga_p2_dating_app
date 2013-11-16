class MessagesController < ApplicationController

  def inbox
    @current_user = User.find 2 # hard-coded until current_user is available from Devise
    @contact_list = @current_user.contact_list
  end

  def conversation
    @current_user    = User.find 2 # hard-coded until current_user is available from Devise
    
    @other_user      = User.find params[:id]
    @message_thread  = @current_user.messages_with_user params[:id]
    
    @new_message     = @current_user.messages_sent.new(recipient_id: @other_user.id)

    render :layout => false
  end

  def create
    Message.create params[:message]
    redirect_to inbox_url
  end

  def destroy
    Message.find(params[:id]).destroy
    redirect_to inbox_url
  end

end