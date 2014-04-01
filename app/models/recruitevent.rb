class Recruitevent < ActiveRecord::Base

    versioned

    belongs_to :recruit
    belongs_to :attendancetype

end
