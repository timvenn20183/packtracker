class AdultrolesController < ApplicationController

	layout 'main'

	before_filter :validate_credentials

	def token_search
		@adultroles = Adultrole.where("name like ?", "%#{params[:q]}%")
		respond_to do |format|
		     format.json { render :json => @adultroles.map(&:attributes) }
		end
	end

end
