class User < ActiveRecord::Base

    versioned

    belongs_to :parent

    serialize :options, Hash

    public

    def fullname
        return self.parent.firstnames + " " + self.parent.surname if self.parent != nil
        return self.name if self.parent == nil
    end

    def can_modify_admin_recruit
        # STUB
        return true
    end

    def can_modify_admin_parent
        # STUB
        return true
    end

    def can_manage_families
        # STUB
        return true
    end

    def can_search
        # STUB
        return true
    end

    def can_admin
        # STUB
        return true
    end

    def associated_parents
        parents = Array.new
        parents << self.parent if self.parent != nil
        recruits = self.parent.recruits if !self.parent.blank?
            recruits.all.each do |recruit|
                recruit.parents.all.each do |parent|
                    parents << parent
                end
            end
        parents.uniq!
        return parents
    end

    def associated_recruits
         return self.parent.recruits if !self.parent.blank?
    end

    def list_patrols
        # STUB
        # List of possible patrols this user can assign
        return Patrol.all
    end

    def list_burrows
        # STUB
        # List of possible burrows this user can assign
        return Burrow.all
    end

    def list_sixers
        # STUB
        # List of possible sixers this user can assign
        return Sixer.all
    end

    private

end
