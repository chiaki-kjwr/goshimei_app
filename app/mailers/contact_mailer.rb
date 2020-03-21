class ContactMailer < ApplicationMailer
    def contact_mail(contact)
        @contact = contact
        mail to:"chiakikajiwara@gmail.com",subject: "confirmation"
      end
    end
end
