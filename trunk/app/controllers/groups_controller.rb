class GroupsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  def create
    group = Group.new(params[:group])
    group.users << User.find(params[:group][:user_id])
    respond_to do |format|
      if group.valid?
        group.save
        format.json { render :json => group.to_json }
      else
        render :json => group.errors, :status => :unprocessable_entity
      end
    end
  end

  def update
    respond_to do |format|
      group = Group.find(params[:group][:id])
      if group.update_attributes(params[:group])
        format.json { render :json => group.to_json }
      else
        render :json => group.errors, :status => :unprocessable_entity
      end
    end
  end

  def destroy
    group = Group.find(params[:id])

    respond_to do |format|
      if group.destroy
        format.json { head :ok }
      else
        format.json { head :unprocessable_entity }
      end
    end
  end
  
end
