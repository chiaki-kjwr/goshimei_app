class ChatRoomsController < ApplicationController
  include ApplicationHelper

  def show
    @chat_room = ChatRoom.find(params[:id]) #ルーム情報の取得
    #@chat_message = ChatMessage.create! #新規メッセージ投稿
    @chat_message = ChatMessage.new(message_params)
    @chat_messages = @chat_room.chat_messages
    #@chat_message = ChatMessage.all
    #このルームのメッセージを全て取得
    #@company.name = @chat_room.company.name
    @chat_message.save

    if user_signed_in?
      @chat_room = ChatRoom.new(room_company_params)


      @chat_room.user_id = current_user.id
      #redirect_to :action => "show", :id => @chat_room.id
      #if @chat_room.user.id == current_user.id
        @company = @chat_room.company


      else
        redirect_to "/"
      end
    end
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
    @chat_room = ChatRoom.create(room_company_params)
    @chat_room.save!(room_company_params)
    render :show






#params使用しないチャット------------------------------------------------
    #current_user_chat_rooms = ChatRoom.where(user_id: current_user.id).map(&:chat_room)
    #@chat_room = ChatRoom.where(chat_room: current_user_chat_rooms, user_id: params[:user_id]).map(&:chat_room).first

        #if @chat_room.blank?
          #@chat_room = ChatRoom.new
          #@chat_room.save!(user_id: current_user.id,company_id: current_post.company_id)
#params使用しないチャット-----------------------------------------------

          #redirect_to action: :show, id: chat_room.id
        end

    @chat_room.user_id = current_user.id
    @chat_room.save
    @chat_room.company
    #↓追記したがエラー変わらずosts
    #@chat_room.company = post.company


    #redirect_to :action => "show", :id => @chat_room.id
    #render :show


    #if @chat_room.save
      #ここが機能してない
      #redirect_to :action => "show", :id => @chat_room.id

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

  def message_params
    params.permit(:message,:chat_room_id)
  end

  def current_post
    current_post = Post.find(id: params[:id])
  end

end
