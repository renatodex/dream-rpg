class User < ActiveRecord::Base
  belongs_to :key
  
  validates :name, 
    presence: { message: I18n.t(:register_empty_name) },
    format: {
      with: /(^[a-zA-Z0-9. ]+$)/,
      message: I18n.t(:register_invalid_format_name)
    },
    length: { 
      in: 3..100,
      message: I18n.t(:register_invalid_length_name) 
    }
  validates :login, 
    presence: { message: I18n.t(:register_empty_login) },
    uniqueness: { message: I18n.t(:register_duplicated_login) },
    format: {
      with: /(^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$)/,
      message: I18n.t(:register_login_invalid_email)
    }
  validates :password, 
    presence: { message: I18n.t(:register_empty_password) },
    length: {
      in: 6..16,
      message: I18n.t(:register_invalid_length_password)
    }
end
