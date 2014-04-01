class RecruitsController < ApplicationController

    layout 'main'

    before_filter :validate_credentials

    def enroll
        @user = current_user
        @parent = Parent.find(decrypt(params[:id]))
        @recruit = Recruit.new
        @recruit.inherit_from_parent(@parent)
        # STUB - PER GROUP OR DISTRICT
        @patrols = current_user.list_patrols
        @burrows = current_user.list_burrows
        @sixers = current_user.list_sixers
    end

    def create
        @recruit = Recruit.new
        @parent = Parent.find(decrypt(params[:parent_id]))
        @recruit.parents << @parent
        # STUB - PER GROUP OR DISTRICT
        @patrols = current_user.list_patrols
        @burrows = current_user.list_burrows
        @sixers = current_user.list_sixers
        @user = current_user
        respond_to do |format|
            if @recruit.update_attributes(recruit_params) then
                format.js { render 'create_success' }
            else
                format.js { render 'create_failure' }
            end
        end
    end

    def edit
        @recruit = Recruit.find(decrypt(params[:id]))
        @user = current_user
        # STUB - PER GROUP OR DISTRICT
        @patrols = current_user.list_patrols
        @burrows = current_user.list_burrows
        @sixers = current_user.list_sixers
    end

    def update
        @recruit = Recruit.find(decrypt(params[:id]))
        if current_user.can_modify_admin_recruit then
            @recruit.reset_boolean_options
        end
        respond_to do |format|
            if @recruit.update_attributes(recruit_params) then
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

    private

    def recruit_params
        params.require(:recruit).permit!
    end

end
