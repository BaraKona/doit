#email:string
#password_digest:string
#user_name:string

#password:string virtual
#password_confirmation:string virtual

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
  validates :password, presence: true, confirmation: true, length: { minimum: 6, message: "must be at least 6 characters"}
  validates :user_name, presence: true, uniqueness: true, length: { minimum: 3, message: "must be at least 3 characters"}

end
