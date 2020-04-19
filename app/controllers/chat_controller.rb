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
    

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    

    #@chat_message = @chat_message.order(:created_at)
    #@chat_message = @chat_room.message.build
  end

  
  

  def create
    @message = @conversation.messages.build(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      render 'index'
    end
  end

  private

  def chat_room_params
    params.require(:message).permit(:sender_id, :recipient_id)
  end
end



      #@chat_room = ChatRoom.new
      #if @chat_message.present?
        #@chat_message.create!
      #redirect_to chat_index_path
     #else
      #redirect_to root_path
      #end
  
  #if Conversation.between(params[:sender_id], params[:recipient_id]).present?
   # @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
  #else
   #@conversation = Conversation.create!(conversation_params)
  #end
  #redirect_to conversation_messages_path(@conversation)
  
    #private
    
    #def room_user_params
      #params.permit(:user_id,:message)
    #end


