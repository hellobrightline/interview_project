# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  date_of_birth :string
#  first_name    :string
#  last_name     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Member < ApplicationRecord
  has_many :exercise_assignments

  validates_presence_of :first_name, :last_name, :date_of_birth

  def full_name
    "#{first_name} #{last_name}"
  end
end
