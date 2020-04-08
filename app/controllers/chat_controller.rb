class ChatController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @chat_rooms = ChatRoom.all
  end


  def show
    @chat_room = ChatRoom.find(params[:id])
    @chat_rooms_message = @chat_messages.message
  end

  def create
    @chat_room = ChatRoom.new
    @chat_room.save
    ChatRoomUser.create(chat_room: chat_room, user_id: current_user.id)
    ChatRoomUser.create(chat_room: chat_room, user_id: params[:user_id])
    redirect_to action: :show, id: chat_room.id
  end
end



