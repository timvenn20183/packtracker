class ParentsController < ApplicationController

    layout 'main'

    before_filter :validate_credentials

    def index
        @user = current_user
    end

    def edit
        @parent = Parent.find(decrypt(params[:id]))
        @user = current_user
    end

    def update
        @parent = Parent.find(decrypt(params[:id]))
        @parent.adultrole_ids = params[:role][:adultrole_tokens].split(",")
        @parent.committee_ids = params[:committee][:committee_tokens].split(",")
        @parent.member_of_scouts_sa = false
        respond_to do |format|
            if @parent.update_attributes(parent_params) then
                @user = current_user
                @parent = @user.parent
                @parents = @user.associated_parents
                @recruits = @user.associated_recruits
                format.js { render 'success' }
            else
                format.js { render 'failure' }
            end
        end
    end

    def create
        @parent = Parent.new
        respond_to do |format|
            if @parent.update_attributes(parent_params) then
                @user = current_user
                @parent = @user.parent
                @parents = @user.associated_parents
                @recruits = @user.associated_recruits
                format.js { render 'create_success' }
            else
                format.js { render 'create_failure' }
            end
        end
    end
    def enrole
        @parent = Parent.new
        @user = current_user
    end

    private

    def parent_params
        params.require(:parent).permit!
    end

end
