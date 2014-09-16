class GroupsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  #devuelve el listado de puntos de interes, recibe los filtros a aplicar para la busqueda, obligatoriamente la ubicacion del usuario
  def index
    #usamos la gema geocoder para buscar todos los puntos dentro de un determinado radio de la ubicacion del usuario
    respond_to do |format|
      if params[:user_id]
        groups = Group.where(user_id: params[:user_id])
        format.json { render :json => groups }
      else
        render :json => "filtros incompletos", :status => :unprocessable_entity
      end
    end
  end

  def create
    group = Group.new(params[:group])

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
