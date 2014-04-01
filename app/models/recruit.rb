class Recruit < ActiveRecord::Base

    versioned

    has_and_belongs_to_many :parents
    has_many :recruitevents
    belongs_to :patrol
    belongs_to :burrow
    belongs_to :sixer

    validates :recruit_firstnames, presence: true
    validates :recruit_surname, presence: true

    before_save do
    	self.update_search_string
    end

    public

    def fullname
        return self.recruit_firstnames + " " + self.recruit_surname
    end

    def update_search_string
    	self.searchstring = self.recruit_surname.downcase if !self.recruit_surname.blank?
        self.searchstring += self.recruit_firstnames.downcase if !self.recruit_firstnames.blank?
        self.searchstring += self.recruit_idnumber.downcase if !self.recruit_idnumber.blank?
    end

    def reset_boolean_options
        self.scout = false
        self.cub = false
        self.meerkat = false
        self.is_sixer = false
        self.is_second = false
        self.is_patrol_leader = false
        self.is_assistant_patrol_leader = false
    end

    def inherit_from_parent(parent)
          self.recruit_surname = parent.surname
          self.recruit_address = parent.address
          self.recruit_tel_home = parent.tel_home
          self.recruit_tel_cell = parent.cell
          self.recruit_email = parent.email
    end

    def self.recruit_rollcall_list(user)
        # STUB
        # List of recruits that a user can include in a rollcall
        return Recruit.where(:cub => true)
    end

    def has_attended_event(attendancetype, applydate)
        event = Recruitevent.new
        event.recruit = self
        event.related_date = applydate
        event.attendancetype = Attendancetype.find(attendancetype)
        event.save
    end

    def did_attend_event(attendancetype, applydate)
       return true if !self.recruitevents.where(:attendancetype_id => attendancetype, :related_date => applydate).blank?
       return false
    end

    def did_not_attend_event(attendancetype, applydate)
        events = self.recruitevents.where(:attendancetype_id => attendancetype, :related_date => applydate)
        if !events.blank? then
            events.each do |event|
                event.destroy
            end
        end
    end

    def family_code
        return self.parents.first.family_code
    end

    private

end
