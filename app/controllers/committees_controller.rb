class CommitteesController < ApplicationController

	layout 'main'

	before_filter :validate_credentials

	def token_search
		@committees = Committee.where("name like ?", "%#{params[:q]}%")
		respond_to do |format|
		     format.json { render :json => @committees.map(&:attributes) }
		end
	end

end
