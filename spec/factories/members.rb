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
FactoryBot.define do
  factory :member do
    sequence(:first_name) { |i| "member_first_name_{i}" }
    sequence(:last_name) { |i| "member_last_name_{i}" }
    sequence(:email) { |i| "member{i}@example.com" }
    date_of_birth { rand(18..100).years.ago - rand(0..365).days.ago }
  end
end
