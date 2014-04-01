class AttendanceController < ApplicationController

	layout 'main'

	before_filter :validate_credentials

	def index
		# when
		@applydate = Date.current
		# who
		@user = current_user
		@recruits = Recruit.recruit_rollcall_list(@user)
		@attendancetypes = Attendancetype.all
		@attendancetype = @attendancetypes.first.id
	end

	def create
		@recruits = Array.new
		@applydate = params[:applydate]
		attendancetype = params[:attendancetype]
		params[:recruit].to_a.each do |atendee|
			recruit = Recruit.find(decrypt(atendee.to_a[0]))
			@recruits << recruit
			recruit.has_attended_event(attendancetype, applydate)
		end
	end

	def update_create_list
		@user = current_user
		@applydate = params[:applydate]
		@attendancetype = Attendancetype.find(params[:attendancetype])
		@recruits = Recruit.recruit_rollcall_list(@user)
		respond_to do |format|
			format.js
		end
	end

	def update_recruits_event_status
		recruit = Recruit.find(decrypt(params[:id]))
		applydate = params[:applydate]
		attendancetype = params[:attendancetype]
		if recruit.did_attend_event(attendancetype, applydate) then
			recruit.did_not_attend_event(attendancetype, applydate)
		else
			recruit.has_attended_event(attendancetype, applydate)
		end
		render :nothing => true
	end

end
