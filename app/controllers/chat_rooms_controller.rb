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

#binding.pry

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
  #end

  def create
    if user_signed_in?
    #userがログインしてたらuser_idを, shopがログインしてたらshop_idを@roomにいれる
    @chat_room = ChatRoom.new(room_company_params)
    @chat_room.user_id = current_user.id
    @chat_room.company
    #↓追記したがエラー変わらず
    #@chat_room.company = post.company
    @chat_room.save

    binding.pry

    redirect_to :action => "show", :id => @chat_room.id
    #render :show

    elsif company_signed_in?
      @chat_room = ChatRoom.new(room_user_params)
      @chat_room.company_id = current_company.id
      @chat_room.save

    #else
      #redirect_to "/"
   #end

    #if @chat_room.save
      #ここが機能してない
      #redirect_to :action => "show", :id => @chat_room.id

    #else
      #redirect_to "/"
    end
  end



  private
  def room_company_params
    params.permit(:user_id,:company_id)
  end

  def room_user_params
    params.require(:chat_room).permit(:company_id)
  end

  def message_params
    params.permit(:message,:chat_room_id)
  end

end
