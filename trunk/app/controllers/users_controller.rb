class UsersController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

	def get_or_create
	    user = User.where(:facebook_id => params[:facebook_id]).first
	    if user.blank?
	    	user = User.new(:facebook_id => params[:facebook_id], :name => params[:name],  :surname => params[:surname])
	  	end

	    respond_to do |format|
	      if user.valid?
	        user.save
	        format.json { render :json => user.to_json }
	      else
	        render :json => user.errors, :status => :unprocessable_entity
	      end
	    end
	end

end
