class Committee < ActiveRecord::Base

    versioned

    has_and_belongs_to_many :parents

end
