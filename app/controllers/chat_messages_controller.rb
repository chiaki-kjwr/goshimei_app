class ChatMessagesController < ApplicationController
  include ApplicationHelper
  protect_from_forgery

  def create
      @chat_room = ChatRoom.find(params[:chat_room_id])

      #if company_signed_in?
        #@chat_message = ChatMessage.create!(chat_room_id:@chat_room.id,message: params[:chat_message][:message],is_user:params[:chat_message][:is_user])
        @chat_message = ChatMessage.create!(chat_room_id:@chat_room.id,message: params[:chat_message][:message],is_user: params[:chat_message][:is_user])

      #end

=begin
if company_signed_in?
        @chat_message.is_user == false
      #elsif company_signed_in?
      else
        @chat_message.is_user == true
      end
=end

      redirect_to chat_room_path(@chat_room.id)

  end
end
