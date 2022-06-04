sign_up_params = [:name, :email, :password, :password_donfirmation, :icon_name]
sign_up_params[icon_name] = default_user.jpg

puts sign_up_params[icon_name]