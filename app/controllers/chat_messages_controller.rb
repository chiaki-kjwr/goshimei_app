class ChatMessagesController < ApplicationController
  include ApplicationHelper

  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @chat_message = ChatMessage.create!(chat_room_id: @chat_room.id, message: params[:chat_message][:message])

    if @chat_message.create!

      flash.now[:notice] = "チャットを送りました"
    else
      redirect_to chat_room_path, notice: "チャット送信に失敗しました"
    end
  end

  private

  def message_params
    params.require(:chat_message).permit(:message, :chat_room_id).merge(user_id: current_user.id)
  end
end
