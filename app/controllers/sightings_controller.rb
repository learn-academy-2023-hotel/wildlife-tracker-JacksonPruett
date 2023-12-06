class SightingsController < ApplicationController
    def index
        # this allows you to see all sightings in the browser - R in crud
        sightings = Sighting.where(date: params[:start_date]..params[:end_date])
        render json: sightings
    end
  end

    def show
        # this allows you to see individual sightings in the browser - R in crud
        sighting = Sighting.find(params[:id])
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end

    def create
        sighting = Sighting.create(sighting_params)
    end

    def destroy 
    #   this allows you to delete a sighting, identified by id   
      sighting = Sighting.find(params[:id])
      if sighting.destroy
        render json: sighting
      else
        render json: sighting.errors
      end
    end  

    def update 
    #   this allows you to update information for each sighting, identified by id   
      sighting = Sighting.find(params[:id])
      sighting.update(sighting_params)
      if sighting.valid?
        render json: sighting
      else
        render json: sighting.errors
      end
    end    

    private # strong params - security feature that allows devs to control what params are allowed
      def sighting_params
       params.require(:sighting).permit(:animal_id, :latitude, :longitude, :date, :start_date, :end_date)
    end    
end
