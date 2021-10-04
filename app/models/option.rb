class Option < ApplicationRecord

    has_many :avatars
    has_many :users, through: :avatars

end
