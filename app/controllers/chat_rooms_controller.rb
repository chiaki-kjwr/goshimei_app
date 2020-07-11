class ChatRoomsController < ApplicationController
  include ApplicationHelper

  def index
    @chat_rooms = current_user.chat_rooms.all
  end

  def show
    @chat_room = ChatRoom.find(params[:id]) # ルーム情報の取得
    @company = @chat_room.company
    @chat_messages = @chat_room.chat_messages
  end

  def create
    if user_signed_in?
      @chat_room = ChatRoom.where(user_id: current_user.id, company_id: params[:company_id]).first
      if @chat_room.present?
        redirect_to chat_room_path(@chat_room.id) and return
      else
        @chat_room = ChatRoom.create(room_company_params)
        @chat_room.save!(room_company_params)
        redirect_to chat_room_path(@chat_room.id)
      end
    end
  end

  private

  def room_company_params
    params.permit(:company_id, :user_id)
  end
end
