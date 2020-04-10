class PagesController < ApplicationController

    def home
        if user_signed_in?
         @users = User.all
         chat_rooms = current_user.chat_rooms
            #自分が入ってるroomの相手のidを格納する
            @user_ids = []
            chat_rooms.each do |c|
            @user_ids << c.user_id
            end
        end
    end

    def terms
    end
end
