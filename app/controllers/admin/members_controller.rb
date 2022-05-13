# frozen_string_literal: true

module Admin
  class MembersController < ApplicationController
    before_action :set_member, only: [:show, :update, :destroy]

    def index
      @members = Member.all

      render json: @members
    end

    def show
      render json: @member
    end

    def create
      @member = Member.new(member_params)

      if @member.save
        render json: @member, status: :created, location: admin_member_path(@member)
      else
        render json: @member.errors.full_messages, status: :unprocessable_entity
      end
    end

    def update
      if @member.update(member_params)
        render json: @member
      else
        render json: @member.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @member.destroy
    end

    private

    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:first_name, :last_name, :date_of_birth, :email, :password)
    end
  end
end
