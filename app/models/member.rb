# frozen_string_literal: true

# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  date_of_birth :string           not null
#  email         :string           not null
#  first_name    :string           not null
#  last_name     :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Member < ApplicationRecord
  has_many :exercise_assignments
  has_many :pending_exercise_assignments, -> { where(status: "pending") }, class_name: "ExerciseAssignment"

  validates_presence_of :first_name, :last_name, :date_of_birth, :email

  scope :with_pending_exercise_assignments, -> { joins(:pending_exercise_assignments).distinct }

  def full_name
    "#{first_name} #{last_name}"
  end
end
