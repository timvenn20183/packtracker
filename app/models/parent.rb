class Parent < ActiveRecord::Base

    versioned

    has_and_belongs_to_many :recruits
    has_and_belongs_to_many :adultroles
    has_and_belongs_to_many :committees
    has_many :users

    validates :firstnames, presence: true
    validates :surname, presence: true

    before_save do
    	self.update_search_string
        self.create_family_code
    end

    def adultrole_tokens=(ids)
        self.adultrole_ids = ids.split(",")
    end

    def fullname
        full_name = self.firstnames + " " if !self.firstnames.blank?
        full_name += self.surname if !self.surname.blank?
    end

    def update_search_string
    	self.searchstring = self.surname.downcase if !self.surname.blank?
        self.searchstring += self.firstnames.downcase if !self.firstnames.blank?
        self.searchstring += self.idnumber.downcase if !self.idnumber.blank?
    end

    def create_family_code
        # does one of my assoicated parents via recruits have a code ?
        self.recruits.each do |recruit|
            recruit.parents.each do |parent|
                self.family_code = parent.family_code if !parent.family_code.blank? and self.family_code.blank?
            end
        end
        # do we still not have a family code ?
        if family_code.blank? then
            code_counter = 1
            alpha_code = self.surname[0..2].upcase
            num_code = code_counter.to_s.rjust(3,"0")
            code = alpha_code + num_code
            while !Parent.where(:family_code => code).blank? do
                code_counter += 1
                code = alpha_code + code_counter.to_s.rjust(3,"0")
            end
            self.family_code = code
        end
    end

end
