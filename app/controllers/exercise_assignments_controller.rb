class ExerciseAssignmentsController < ApplicationController
  before_action :set_exercise_assignment, only: [:show, :destroy]

  def index
    @exercise_assignments = ExerciseAssignment.all

    render json: @exercise_assignments
  end

  def show
    render json: @exercise_assignment
  end

  def create
    @exercise_assignment = ExerciseAssignment.new(exercise_assignment_params)

    if @exercise_assignment.save
      render json: @exercise_assignment, status: :created, location: @exercise_assignment
    else
      render json: @exercise_assignment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise_assignment.destroy
  end

  private
    def set_exercise_assignment
      @exercise_assignment = ExerciseAssignment.find(params[:id])
    end

    def exercise_assignment_params
      params.require(:exercise_assignment).permit(:exercise_id, :member_id)
    end
end