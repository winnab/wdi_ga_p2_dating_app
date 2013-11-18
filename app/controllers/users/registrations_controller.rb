class Users::RegistrationsController < Devise::RegistrationsController



  def new
    super
    puts "hi there"
  end

  # def create
  #   super
  # end

  # def edit
  #   super
  # end

  # def update
  #   super
  #   # custom here
  # end


end