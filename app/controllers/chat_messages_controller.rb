class ChatMessagesController < ApplicationController
  include ApplicationHelper

  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @chat_message = ChatMessage.create!(message_params)



    　#if user_signed_in?
      #@chat_message.is_user = true
    #elsif company_signed_in?
      #@chat_message.is_user = false
    #end

    #@chat_message.chat_room_id = @chat_room.id
    if @chat_message.save
      flash.now[:notice] = "チャットを送りました"
    else
      redirect_to chat_room_path,notice:"チャット送信にしっぱいしました"
    end
  end

  def message_params
    params.require(:chat_message).permit(:message,:user_id,:chat_room_id).merge(user_id:current_user.id)
  end
end
