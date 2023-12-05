class AnimalsController < ApplicationController
    def index
        # this allows you to see all animals in the browser - R in crud
        animals = Animal.all
        render json: animals
    end

    def show
        # this allows you to see individual animals in the browser - R in crud
        animal = Animal.find(params[:id])
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end

    def create
        animal = Animal.create(animal_params)
    end

    def destroy 
    #   this allows you to delete an animal, identified by id   
      animal = Animal.find(params[:id])
      if animal.destroy
        render json: animal
      else
        render json: animal.errors
      end
    end  

    def update 
    #   this allows you to update information for each animal, identified by id   
      animal = Animal.find(params[:id])
      animal.update(animal_params)
      if animal.valid?
        render json: animal
      else
        render json: animal.errors
      end
    end    

    private # strong params - security feature that allows devs to control what params are allowed
      def animal_params
    #    required parameters for animal are common_name and scientific_binomial
    #    or it means params require animal to permit common_name and scientific_binomial 
       params.require(:animal).permit(:common_name, :scientific_binomial)
    end    
end
