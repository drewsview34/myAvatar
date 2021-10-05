class User < ApplicationRecord

    has_secure_password

    has_many :avatars
    has_many :options, through: :avatars

end
