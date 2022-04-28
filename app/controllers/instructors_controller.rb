class InstructorsController < ApplicationController
before_action :find_instructor, only: [:show, :destroy]

    def index
        instructors = Instructor.all
        render json: instructors, status: :ok
    end

    def show
        render json: @instructor, status: :ok
    end

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    end

    def destroy
        @instructor.destroy
        render json: { message: "Instructor terminated :)"}, status: :ok
    end
    
    private

    def instructor_params
        params.permit(:name)
    end

    def find_instructor
        @instructor = Instructor.find(params[:id])
    end

end
