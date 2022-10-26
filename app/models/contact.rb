class Contact < ApplicationRecord
  
    #self.per_page = 5
    #WillPaginate.per_page = 2
    belongs_to :user
    validates_presence_of :firstName, message: 'First Name is Mandatory!' 
    validates_presence_of :lastName, message: 'Last Name is Mandatory!' 
    validates_presence_of :city, message: 'City is Mandatory!' 
    validates_presence_of :address, message: 'Address is Mandatory!' 
    validates :email, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}
    validates :phone, length: { is: 10}

    has_one_attached :dp
    
    def dp_thumbnail
        if dp.attached?

          dp.variant(resize_to_limit:[200,200]).processed 
        else
          '/photo.png'
        end    
    end

    def self.search( keywords)
      if keywords 
        where("firstName LIKE ? OR lastName LIKE ? OR id LIKE ?", "%#{keywords}%", "%#{keywords}%", "%#{keywords}%")
      end
    end
 

end
