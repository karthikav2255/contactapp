class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @contacts=current_user.contacts.where("contacts.favourite=?","1")
  end

  def new
  end
end
