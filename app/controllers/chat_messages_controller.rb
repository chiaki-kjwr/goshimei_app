class MessagesController < ApplicationController
  before_action do
    @chat_room = ChatRoom.find(params[:chat_room_id])
  end

  def index
    @messages = @chat_room.messages

    if @messages.length > 10
      @over_ten = true１
      @messages = ChatMessage.where(id: @messages[-10..-1].pluck(:id))
    end

    if params[:m]
      @over_ten = false
      @messages = @chat_room.messages
    end

    if @messages.last
      @messages.where.not(user_id: current_user.id).update_all(read: true)
    end

    @messages = @messages.order(:created_at)
    @message = @chat_room.messages.build
  end

  def create
    @message = @chat_room.messages.build(message_params)
    if @message.save
      redirect_to chat_room_messages_path(@chat_room)
    else
      render 'index'
    end
  end

  
  
  
  #%def createchat_room = ChatRoom.find(params[:chat_room_id])
    <#%@chat_message = ChatMessage.new(message_params)
    #if user_signed_in?
      #@message.is_user = true
    #end

    #@message.chat_room_id = @chat_room_id
    #if @message.save
      #redirect_to chat_path(@chat)
    #end
  #end%>

  private
  def message_params
    params.require(:message).permit(:message)
  end
end
