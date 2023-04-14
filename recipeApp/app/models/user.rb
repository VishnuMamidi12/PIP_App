require 'bcrypt'
class User < ApplicationRecord
    require 'jwt'
#include bcrypt

    validates :email, :first_name, :last_name, presence: true
    validates :password, presence: true, confirmation: true
end
  