class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to root_path,notice: 'お問い合わせありがとうございます。３営業日以内に返信させて頂きます。'
    else
      redirect_to new_contact_path
      flash[:alert] = "送信に失敗しました"
    end
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :email, :contents)
    end
end
    
