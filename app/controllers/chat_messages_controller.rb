class MessagesController < ApplicationController
  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @chat_message = ChatMessage.new(message_params)
    
    if user_signed_in?
      @message.is_user = true
    end

    @message.chat_room_id = @chat_room_id
    if @message.save
      redirect_to chat_path(@chat)
    end
  end

  private
  def message_params
    params.require(:message).permit(:message)
  end
end
