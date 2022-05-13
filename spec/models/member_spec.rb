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
require "rails_helper"

RSpec.describe Member, type: :model do
  describe "#full_name" do
    it "constructs the full name of the member" do
      member = Member.new(first_name: "Jane", last_name: "Doe")
      expect(member.full_name).to eq("Jane Doe")
    end
  end
end
