class FamilyController < ApplicationController

	layout 'main'

	before_filter :validate_credentials

	def index
		@user = current_user
		@results = Array.new
		if @user.options[:last_search] != nil
			@results = Parent.where("searchstring like ?", "%" + @user.options[:last_search].to_s.downcase + "%")
			@results += Recruit.where("searchstring like ?", "%" + @user.options[:last_search].to_s.downcase + "%")
		end

	end

    def my_family
        @user = current_user
        @parent = @user.parent
        @parents = @user.associated_parents
        @recruits = @user.associated_recruits
        respond_to do |format|
            format.js
        end
    end

    def family_management
    end

	def search
		@results = Parent.where("searchstring like ?", "%" + params[:search].to_s.downcase + "%")
		@results += Recruit.where("searchstring like ?", "%" + params[:search].to_s.downcase + "%")
		@user = current_user
		@user.options[:last_search] = params[:search]
		@user.save
		respond_to do |format|
			format.js
		end
	end

	def enrole
		@user = current_user
	end

end
