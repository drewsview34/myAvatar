class User < ApplicationRecord

    has_many :avatars
    has_many :options, through: :avatars

end
