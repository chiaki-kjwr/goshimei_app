class ChatController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @chat_rooms = ChatRoom.all
  end

  def show
   
    #@user == user(current_user)
    @chat_room = ChatRoom.find_by(params[:id])
    @message = ChatMessage.new
    @messages = ChatMessage.all
  end
  

  def create
        @chat_room = ChatRoom.new
      if @chat_room.save
 
        redirect_to :action => "show", :id => @chat_rodom.id
      end
  end
  
    #private
    
    #def room_user_params
      #params.permit(:user_id,:message)
    #end
end

