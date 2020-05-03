class PagesController < ApplicationController

    def home
        if user_signed_in?
        @companies = Company.all
        chat_rooms = current_user.chat_rooms
        @company_ids = []
        chat_rooms.each do |c|
        @company_ids << c.company_id
        end
    end

    def terms
    end

    def company_home
    end
end
