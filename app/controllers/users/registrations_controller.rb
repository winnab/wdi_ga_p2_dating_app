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

  def update
    super
    if @user.save
      # remove all previous qualities of this user
      @user.qualities.destroy_all 
      # reset quality values
      params[:quality].each do |quality|
        Quality.create(user_id: @user.id, scope: "Self", quality_type: quality.first, value: quality.last) if quality.last.present?
      end
    end
  end

end