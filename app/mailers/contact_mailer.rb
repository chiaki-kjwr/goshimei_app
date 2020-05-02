class ContactMailer < ApplicationMailer
    #def contact_mail(contact)
        #@contact = contact
        #mail to:"chiakikajiwara@gmail.com",subject: "confirmation"
    #end
    def send_mail(contact)
    @contact = contact
    mail(
      from: 'system@example.com',
      #to:   'chiakikajiwara@gmail.com',
      to:   'goshimei2020@gmail.com',
      subject: 'お問い合わせ通知'
    )
  end

end

