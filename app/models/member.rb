# == Schema Information
#
# Table name: members
#
#  id            :bigint           not null, primary key
#  date_of_birth :string
#  first_name    :string
#  last_name     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  external_id   :uuid             not null
#
class Member < ApplicationRecord
  has_many :exercise_assignments
end
