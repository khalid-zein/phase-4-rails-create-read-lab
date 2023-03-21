class PlantsController < ApplicationController
    wrap_parameters format: []

    def index 
        plant = Plant.all
        render json: plant
    end

    def show
        plant = Plant.find_by(id:params[:id])
        if plant
            render json: plant
        else
            render json: { Erro: "Item is not found" }, status: 404
        end
    end
    
    def create
        plant = Plant.create(create_plant_param)
        render json: plant, status: 201
    end

    private

    def create_plant_param
        params.permit(:name, :image, :price)
    end
end
