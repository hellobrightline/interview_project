# frozen_string_literal: true

require "rails_helper"

RSpec.describe SendPendingExerciseAssignmentNotificationJob do
  describe "#perform" do
    context "for a member with pending exercise assignments" do
      it "sends an email to the member" do
        member = FactoryBot.create(:member)
        FactoryBot.create(:exercise_assignment, :pending, member: member)

        expect {
          described_class.new.perform(member.id)
        }.to change { ActionMailer::Base.deliveries.size }.by(1)

        email = ActionMailer::Base.deliveries.last
        expect(email.to).to eq([member.email])
        expect(email.subject).to eq("You have exercises to complete")
      end
    end

    context "for a complete exercise assignment" do
      it "does not send an email" do
        member = FactoryBot.create(:member)
        FactoryBot.create(:exercise_assignment, :completed, member: member)

        expect {
          described_class.new.perform(member.id)
        }.not_to change { ActionMailer::Base.deliveries.size }
      end
    end
  end
end
