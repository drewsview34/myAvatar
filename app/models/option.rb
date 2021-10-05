class Option < ApplicationRecord::Base

    has_many :avatars
    has_many :users, through: :avatars

end
