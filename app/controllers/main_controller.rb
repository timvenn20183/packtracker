class MainController < ApplicationController

    before_filter :validate_credentials, :except => ['sign_in', 'process_sign_in']

    layout :select_layout

    def select_layout
        if action_name == 'sign_in' then
            return 'signin'
        else
            return 'main'
        end
    end

    def index
        @user = current_user
        @parent = @user.parent
        @parents = Array.new
        @parents  << @user.parent if @user.parent != nil
        @recruits = @parent.recruits if !@parent.blank?
        @recruits.all.each do |recruit|
            recruit.parents.all.each do |parent|
                @parents << parent
            end
        end
        @parents.uniq!
    end

    def sign_in
    end

    def sign_out
        session[:user] = nil
        redirect_to '/'
    end

    def process_sign_in
        # STUB
        session[:user] = encrypt("1")
        redirect_to '/'
    end

end
