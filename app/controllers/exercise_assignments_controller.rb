class ExerciseAssignmentsController < ApplicationController
  before_action :set_exercise_assignment, only: [:show, :destroy, :update]

  def index
    @exercise_assignments = ExerciseAssignment.all

    respond_to do |format|
      format.html
      format.json { render json: @exercise_assignments }
    end
  end

  def show
    render json: @exercise_assignment
  end

  def new
    @exercise_assignment = ExerciseAssignment.new
  end

  def create
    @exercise_assignment = ExerciseAssignment.new(exercise_assignment_params)

    if @exercise_assignment.save
      respond_to do |format|
        format.html { redirect_to @exercise_assignment }
        format.json { render json: @exercise_assignment, status: :created, location: @exercise_assignment }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @exercise_assignment.errors, status: :unprocessable_entity }
      end

    end
  end

  def update
    if @exercise_assignment.update(exercise_assignment_params)
      render json: @exercise_assignment
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
      params.require(:exercise_assignment).permit(:exercise_id, :member_id, data: {})
    end
end
