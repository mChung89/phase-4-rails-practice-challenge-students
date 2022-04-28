class StudentsController < ApplicationController
before_action :find_student, only: [:show, :destroy]

    def index
        students = Student.all
        render json: students, status: :ok
    end

    def show
        render json: @student, status: :ok
    end

    def create
        student = Student.create!(student_params)
        render json: student, status: :created
    end

    def destroy
        @student.destroy
        render json: { message: 'Deleted successfully!'}, status: :accepted
    end
    
    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def find_student
        @student = Student.find(params[:id])
    end
end
