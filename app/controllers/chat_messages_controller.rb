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
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @chat_message = ChatMessage.new(message_params)
    #メッセージがuserによるものだったらis_user=true, shopによるものだったらis_user=false
    
  end

  private
  def message_params
    params.require(:message).permit(:message)
  end
end
