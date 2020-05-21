class ChatRoomsController < ApplicationController
  include ApplicationHelper

  def index
    @chat_rooms = current_user.chat_rooms.all
    #@chat_room = current_user.chat_rooms.find(user_id:current_user.id)
    #@companis = @chat_rooms.company.name
  end

  def show
    @chat_room = ChatRoom.find(params[:id]) #ルーム情報の取得

    @company = @chat_room.company

    @company_name = @company.name

     #@chat_room_id = current_user.chat_rooms.find_by(company_id: @post.company_id,chat_room_id: @chat_room_id)

  end
    #@chat_message = ChatMessage.new(message_params)


    #@chat_message.save!(message_params)
    #@chat_messages = @chat_room.messages
    #@chat_message = ChatMessage.all
    #このルームのメッセージを全て取得
    #@company.name = @chat_room.company.name
    #if @chat_message present?
        #@chat_message.save
   # end
 #5/20に削除------------------------
    #if user_signed_in?
      #@chat_room = ChatRoom.new(room_company_params)


      #@chat_room.user_id = current_user.id
      #redirect_to :action => "show", :id => @chat_room.id
      #if @chat_room.user.id == current_user.id
        #@company = @chat_room.company

      #else
        #redirect_to "/"
    #------------------------------------------------
    #elsif company_signed_in?
      #if @chat_room.company.id == current_company.id
        #@user = @chat_room.user
      #else
        #redirect_to "/"
      #end
    #else
      #redirect_to "/"
    #end
  #endx

  def create
    if user_signed_in?
    #userがログインしてたらuser_idを, shopがログインしてたらshop_idを@roomにいれる
    #@company = Company.find(params[:id])
    #@chat_room = ChatRoom.create!(user_id:current_user.id,company_id:current_company.id)
      if @chat_room.present?
        #@chat_room = ChatRoom.create(room_company_params)
        #@chat_room.save!(room_company_params)
        #flash[:notice] = 'チャットが開始されました'
        render :show

      else
        @chat_room = ChatRoom.create(room_company_params)
        @chat_room.save!(room_company_params)
        flash[:notice] = 'チャットが開始されました'
        render :show
      end
    end
  end


#params使用しないチャット------------------------------------------------
    #current_user_chat_rooms = ChatRoom.where(user_id: current_user.id).map(&:chat_room)
    #@chat_room = ChatRoom.where(chat_room: current_user_chat_rooms, user_id: params[:user_id]).map(&:chat_room).first

        #if @chat_room.blank?
          #@chat_room = ChatRoom.new
          #@chat_room.save!(user_id: current_user.id,company_id: current_post.company_id)
#params使用しないチャット-----------------------------------------------





    #redirect_to :action => "show", :id => @chat_room.id
    #render :show


    #if @chat_room.save


    #else
      #redirect_to "/"

end



  private
  def room_company_params
    #@chat_room = ChatRoom.new
    #@chat_room.save
    params.permit(:company_id,:user_id)
  end

  def room_user_params
    params.require(:chat_room).permit(:company_id)
  end

  #def message_params
    #params.require(:chat_message).permit(:message)
  #end

  def current_post
    current_post = Post.find(id: params[:id])
  end
