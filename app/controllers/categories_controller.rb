class CategoriesController < ApplicationController

  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  def index
    #devuelve todas las categorias ordenadas alfabeticamente
    respond_to do |format|      
        categories = Category.order("name ASC").all
        format.json { render :json => categories.to_json }      
    end
  end


end
