class Avatar < ApplicationRecord::Base

    belongs_to :option
    belongs_to :user

end
