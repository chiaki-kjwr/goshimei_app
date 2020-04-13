class ChatController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @chat_rooms = ChatRoom.all
  end

  def show
   
    #@user == user(current_user)
    @chat_room = ChatRoom.find_by(params[:id])
    
    @chat_message = ChatMessage.new
    @chat_messages = ChatMessage.all
    #@chat_room.user == current_user
    #@messages = @chat_messages.message
  end
  

  def create
      @chat_room = ChatRoom.new
      if @chat_room.save
      redirect_to chat_index_path
     else
      redirect_to root_path
      end
  end
  
    #private
    
    #def room_user_params
      #params.permit(:user_id,:message)
    #end
end

