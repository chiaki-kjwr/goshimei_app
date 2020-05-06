class ChatRoomsController < ApplicationController
  include ApplicationHelper

  def show
    @chat_room = ChatRoom.find(params[:id]) #ルーム情報の取得
    @chat_message = ChatMessage.create! #新規メッセージ投稿
    
    
    binding.pry
    
    
    @chat_messages = @chat_room.chat_messages #このルームのメッセージを全て取得
    if user_signed_in?
      if @chat_room.user_id == current_user.id
        @company = @chat_room.company_id
        #@company.name = @company.name
        @company_id = @chat_room.company_id
        
      else
        redirect_to "/"
      end
    elsif company_signed_in?
      if @chat_room.company.id == current_company.id
        @user = @chat_room.user
      else
        redirect_to "/"
      end
    else
      redirect_to "/"
    end
  end

  def create
    if user_signed_in?
    #userがログインしてたらuser_idを, shopがログインしてたらshop_idを@roomにいれる
    @chat_room = ChatRoom.new(room_company_params)
    @chat_room.user_id = current_user.id
    elsif company_signed_in?
      @chat_room = ChatRoom.new(room_user_params)
      @chat_room.shop_id = current_shop.id
    else
      redirect_to "/"
    end
    if @chat_room.save
      redirect_to :action => "show", :id => @chat_room.id
    else
      redirect_to "/"
    end
  end


  private
  def room_company_params
    params.permit(:user_id)
  end

  def room_user_params
    params.require(:chat_room).permit(:user_id)
  end

end