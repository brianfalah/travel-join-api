class InterestsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  def index
    #devuelve todas los intereses ordenadas alfabeticamente
    respond_to do |format|
        interests = Interest.order("name ASC").all
        format.json { render :json => interests.to_json }
    end
  end

end
