class PoisController < ApplicationController
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  before_filter :normalize_params, :only => [:create, :update]

  #devuelve el listado de puntos de interes, recibe los filtros a aplicar para la busqueda, obligatoriamente la ubicacion del usuario
  def index
    #usamos la gema geocoder para buscar todos los puntos dentro de un determinado radio de la ubicacion del usuario
    respond_to do |format|
      if params[:user_id] && params[:latitude] && params[:longitude]
        pois = Poi.where(user_id: params[:user_id])
        .near([params[:latitude], params[:longitude]], 1, :units => :km). # puntos a 1 km(se convierte a millas)
          includes(:category, :events)
          if params['categories_ids']
            pois = pois.where(category_id: eval(params['categories_ids']))
          end
        format.json { render :json => pois }
      else
        render :json => "filtros incompletos", :status => :unprocessable_entity
      end
    end
  end

  def create
    poi = Poi.new(params[:poi])

    respond_to do |format|
      if poi.valid?
        poi.save
        format.json { render :json => poi.to_json }
      else
        render :json => poi.errors, :status => :unprocessable_entity
        # render poi.errors.to_json
      end
    end

    # respond_to do |format|
    #   unless promotions == 'ERROR_400'
    #     format.json { render :json => promotions.to_json(:only => [:id, :title, :points_to_accredit, :points_to_debit, :photo_file_name, :start_date, :end_date, :favorites_count, :type, :benefit_value, :benefit_value_type],
    #                                                      :methods => %w(commerce_id points_at_commerce permalink name is_favorite extension_available_on extension_holidays extension_start_time extension_end_time extension_benefit_value extension_benefit_value_type),
    #                                                      :include => [:stores]) }
    #   else
    #     render :json => promotions, :status => :unprocessable_entity
    #   end
    # end

  end

  def update
    respond_to do |format|
      poi = Poi.find(params[:poi][:id])
      if poi.update_attributes(params[:poi])
        format.json { render :json => poi.to_json }
      else
        render :json => poi.errors, :status => :unprocessable_entity
      end
    end
  end

  def normalize_params
    if params[:poi] && params[:poi][:latitude].present? && params[:poi][:longitude].present?
      params[:poi][:latitude] = params[:poi][:latitude].to_f
      params[:poi][:longitude] = params[:poi][:longitude].to_f
    end
  end

  def destroy
    poi = Poi.find(params[:id])

    respond_to do |format|
      if poi.destroy
        format.json { head :ok }
      else
        format.json { head :unprocessable_entity }
      end
    end

  end
end
