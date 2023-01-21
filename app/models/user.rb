class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true, format: {with: /\A\w+\z/, message: "No spaces allowed"}, length: {minimum: 3, maximum:16}
    validates :email, presence: true, format: {with: /\A\S+@\S+\z/, message: "Invalid email address"}
    validates :password, presence: true, length: {minimum: 4, maximum: 20, message: "Your password must be at least 4 characters long."}
end
