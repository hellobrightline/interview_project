# frozen_string_literal: true

module Members
  class ExerciseAssignmentsController < ApplicationController
    include Pagy::Backend

    def index
      @exercise_assignments = current_member.exercise_assignments.pending.order(created_at: :desc)

      respond_to do |format|
        format.json { render json: @exercise_assignments }
      end
    end

    def update
      @exercise_assignment = current_member.exercise_assignments.find(params[:id])

      if @exercise_assignment.update(exercise_assignment_params)
        render json: @exercise_assignment
      else
        render json: @exercise_assignment.errors, status: :unprocessable_entity
      end
    end

    private

    def exercise_assignment_params
      params.require(:exercise_assignment).permit(:exercise_id, :member_id, :status, response: {})
    end

    # In order to keep things simple we just pretend we have authenticated the member successfully.
    def current_member
      Member.find(params[:member_id])
    end
  end
end
