class RollcallController < ApplicationController

	def index
		# when
		@applydate = Date.current
		# who
		@user = current_user
		@recruits = Recruit.recruit_rollcall_list(@user)
	end

	def create
		@recruits = Array.new
		@applydate = params[:applydate]
		params[:recruit].to_a.each do |atendee|
			recruit = Recruit.find(decrypt(atendee.to_a[0]))
			@recruits << recruit
			recruit.has_attended_event(EVENT_NORMAL_MEETING, applydate)
		end
	end

	def update_create_list
		@user = current_user
		@applydate = params[:applydate]
		@recruits = Recruit.recruit_rollcall_list(@user)
		respond_to do |format|
			format.js
		end
	end

	def update_recruits_event_status
		recruit = Recruit.find(decrypt(params[:id]))
		applydate = params[:applydate]
		if recruit.did_attend_event(EVENT_NORMAL_MEETING, applydate) then
			recruit.did_not_attend_event(EVENT_NORMAL_MEETING, applydate)
		else
			recruit.has_attended_event(EVENT_NORMAL_MEETING, applydate)
		end
		render :nothing => true
	end
end
