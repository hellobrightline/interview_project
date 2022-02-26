class ExerciseAssignmentsController < ApplicationController
  before_action :set_exercise_assignment, only: [:show, :destroy, :update]

  def index
    @exercise_assignments = ExerciseAssignment.all

    respond_to do |format|
      format.html
      format.json { render json: @exercise_assignments }
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
