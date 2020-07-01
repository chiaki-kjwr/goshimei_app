class ChatMessagesController < ApplicationController
  include ApplicationHelper
  protect_from_forgery

  def create
      @chat_room = ChatRoom.find(params[:chat_room_id])
      @chat_message = ChatMessage.create!(chat_room_id:@chat_room.id,message: params[:chat_message][:message],is_user: params[:chat_message][:is_user])
      if current_company.present?
        @chat_message.is_user = 'false'
      elsif user_signed_in?
        @chat_message.is_user = 'true'
      end
      redirect_to chat_room_path(@chat_room.id)
  end
end
