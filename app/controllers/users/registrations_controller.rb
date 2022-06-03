# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]


  def account

  end

  def profile
    @profile = Profile.find(current_user.id)
  end

  def editprofile
    @profile = Profile.find_by(user_id: current_user.id)
    old_file_name = @profile.icon_name
    if params[:user_image]
      upload_file = params[:user_image]
      extension = File.extname(upload_file)
      upload_file_name = current_user.id.to_s+extension
      upload_file_path = "app/assets/images/user_images/#{upload_file_name}"
      new_params = params.permit(:name, :user_intro).merge({icon_name: upload_file_name, user_id: current_user.id})
    else
      new_params = params.permit(:name, :user_intro).merge({icon_name: old_file_name, user_id: current_user.id})
    end


    if @profile.update(new_params)
      if params[:user_image]
        File.binwrite(upload_file_path, upload_file.read)
      end
      redirect_to users_profile_path
    else
      render "users/profile"
    end

  end

  # GET /resource/sign_up
  def new
    super
  end

  #POST /resource
  def create
    super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message! :notice, :destroyed
    yield resource if block_given?
    # status:とnotice:を追加
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name), status: :see_other, notice: find_message(:destroyed) }
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
