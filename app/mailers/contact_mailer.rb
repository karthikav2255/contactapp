class ContactMailer < ApplicationMailer
    default from: 'testinnovature2255@gmail.com'
   
    def contact(message,email,sub)
     
      @message = message
      mail(to:[email], subject: sub)
    end
 
end
