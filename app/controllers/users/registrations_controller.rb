class Users::RegistrationsController < Devise::RegistrationsController



  def new
    super
    puts "hi there"
  end




end