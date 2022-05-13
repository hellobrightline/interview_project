# frozen_string_literal: true

module Admin
  class ExerciseAssignmentsController < ApplicationController
    include Pagy::Backend

    def index
      @pagy, @exercise_assignments = pagy(ExerciseAssignment.all.order(created_at: :desc), items: 12)

      respond_to do |format|
        format.html
        format.json { render json: @exercise_assignments }
      end
    end

    def create
      exercise_assignment = ExerciseAssignment.new(exercise_assignment_params)

      respond_to do |format|
        if exercise_assignment.save
          format.html { redirect_to admin_exercise_assignments_path }
          format.json { head :created }
        else
          format.html { redirect_to admin_exercise_assignments_path, alert: "Unable to assign the exercise" }
          format.json { head :unprocessable_entity }
        end
      end
    end

    private

    def exercise_assignment_params
      params.require(:exercise_assignment).permit(:exercise_id, :member_id)
    end
  end
end
