# frozen_string_literal: true

require "rails_helper"

RSpec.describe Exercise do
  describe ".find" do
    it "returns the exercise with the given id" do
      exercise = described_class.find(:all_about_me)
      expect(exercise.id).to eq("all_about_me")
    end

    it "works with strings and symbols" do
      expect(described_class.find(:all_about_me))
        .to eq(described_class.find("all_about_me"))
    end
  end
end
