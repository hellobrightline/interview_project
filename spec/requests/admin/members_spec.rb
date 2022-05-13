# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/admin/members", type: :request do
  let(:valid_attributes) { {first_name: "Lara", last_name: "Croft", date_of_birth: "1992-02-14", email: "foo@example.com"} }
  let(:invalid_attributes) { {first_name: "", last_name: "", date_of_birth: "", email: ""} }

  describe "GET /index" do
    let!(:members) { FactoryBot.create_list(:member, 2) }

    it "renders a successful response" do
      get admin_members_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let!(:member) { FactoryBot.create(:member) }

    it "renders a successful response" do
      get admin_member_path(member)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Member" do
        expect {
          post admin_members_path, params: {member: valid_attributes}
        }.to change(Member, :count).by(1)
      end

      it "renders a JSON response with the new member" do
        post admin_members_path, params: {member: valid_attributes}
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Member" do
        expect {
          post admin_members_path, params: {member: invalid_attributes}
        }.to change(Member, :count).by(0)
      end

      it "renders a JSON response with errors for the new member" do
        post admin_members_path, params: {member: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)

        errors = JSON.parse(response.body)
        expect(errors.size).to eq(4)
        expect(errors).to include("First name can't be blank")
        expect(errors).to include("Last name can't be blank")
        expect(errors).to include("Date of birth can't be blank")
        expect(errors).to include("Email can't be blank")
      end
    end
  end

  describe "PATCH /update" do
    let!(:member) { FactoryBot.create(:member) }

    context "with valid parameters" do
      it "updates the requested member" do
        patch admin_member_path(member), params: {member: valid_attributes}

        expect(member.reload.full_name).to eq("Lara Croft")
      end

      it "renders a JSON response with the member" do
        member = Member.create! valid_attributes
        patch admin_member_path(member), params: {member: valid_attributes}

        expect(response).to have_http_status(:ok)

        member_hash = JSON.parse(response.body)
        expect(member_hash["first_name"]).to eq("Lara")
        expect(member_hash["last_name"]).to eq("Croft")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the member" do
        patch admin_member_path(member), params: {member: invalid_attributes}

        expect(response).to have_http_status(:unprocessable_entity)

        errors = JSON.parse(response.body)
        expect(errors.size).to eq(4)
        expect(errors).to include("First name can't be blank")
        expect(errors).to include("Last name can't be blank")
        expect(errors).to include("Date of birth can't be blank")
        expect(errors).to include("Email can't be blank")
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:member) { FactoryBot.create(:member) }

    it "destroys the requested member" do
      expect {
        delete admin_member_path(member)
      }.to change(Member, :count).by(-1)
    end
  end
end
