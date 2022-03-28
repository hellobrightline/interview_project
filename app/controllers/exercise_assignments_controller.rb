class ExerciseAssignmentsController < ApplicationController
  include Pagy::Backend

  before_action :set_exercise_assignment, only: [:show, :destroy, :update]

  def index
    @pagy, @exercise_assignments = pagy(ExerciseAssignment.all.order(created_at: :desc), items: 12)

    respond_to do |format|
      format.html
      format.json { render json: @exercise_assignments }
    end
  end

  def update
    if @exercise_assignment.update(exercise_assignment_params)
      render json: @exercise_assignment
    else
      render json: @exercise_assignment.errors, status: :unprocessable_entity
    end
  end

  private
    def set_exercise_assignment
      @exercise_assignment = ExerciseAssignment.find(params[:id])
    end

    def exercise_assignment_params
      params.require(:exercise_assignment).permit(:exercise_id, :member_id, data: {})
    end
end
