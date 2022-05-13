# frozen_string_literal: true

class MemberMailer < ApplicationMailer
  default from: "no-reply@example.com"
  layout "mailer"

  def pending_exercise_assignments
    mail(
      to: member.email,
      subject: "You have exercises to complete",
      body: "Please log in to complete your exercises as soon as possible."
    )
  end

  private

  def member
    params[:member]
  end
end
