class ChatController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @chat_room = ChatRoom.find_by(params[:id])
    @chat_messages = ChatMessage.new 
  end
  

  def create
        @chat_room = ChatRoom.new(room_user_params)
      if @chat_room.save
        redirect_to :action => "show", :id => @chat_room.id
      end
  end
  
    private
    
    def room_user_params
      params.permit(:user_id,:message)
    end

end

