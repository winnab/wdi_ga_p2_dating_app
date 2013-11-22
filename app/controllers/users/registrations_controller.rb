class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super

  end

  def create
    super
    if @user.save
      params[:quality].each do |quality|
        Quality.create(user_id: @user.id, scope: "Self", quality_type: quality.first, value: quality.last) if quality.last.present?
      end
    end
    
  end




end