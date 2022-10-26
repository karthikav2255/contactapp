class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable 
  
  has_many :contacts, dependent: :destroy
  has_one_attached :avatar 
  has_many :pictures, dependent: :destroy

  def avatar_thumbnail
    if avatar.attached?
      
      avatar.variant(resize_to_limit:[200,200]).processed 
    else
      '/default_profile.png'
    end    
  end
end
