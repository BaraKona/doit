#email:string
#password_digest:string
#user_name:string

#password:string virtual
#password_confirmation:string virtual

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :password, presence: true, confirmation: true
  validates :user_name, presence: true

end
