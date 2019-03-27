module UsersHelper
  def user_name
    current_user.family_name + current_user.first_name
  end
  def user_name_phonetic
    current_user.family_name_phonetic + current_user.first_name_phonetic
  end
  def user_birth
    current_user.birth_year.to_s + '/ ' + current_user.birth_month.to_s + '/ ' + current_user.birth_day.to_s
  end
end
