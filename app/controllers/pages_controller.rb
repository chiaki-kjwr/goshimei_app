class PagesController < ApplicationController
    include ApplicationHelper

    def home
        if user_signed_in?
        #@user.name = current_user.name
            @companies = Company.all
            chat_rooms = current_user.chat_rooms
            @company_ids = []
            chat_rooms.each do |c|
                @company_ids << c.company_id
            end
        elsif company_signed_in?
            @users = User.all
            chat_rooms = current_company.chat_rooms
        #自分が入ってるroomの相手のidを格納する
            @user_ids = []
            chat_rooms.each do |c|
                @user_ids << r.user_id
            end
        end
    end
    

    def terms
    end
end
