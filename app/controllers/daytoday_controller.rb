class DaytodayController < ApplicationController

	layout 'main'

	before_filter :validate_credentials

	def index
		@user = current_user
	end
end
