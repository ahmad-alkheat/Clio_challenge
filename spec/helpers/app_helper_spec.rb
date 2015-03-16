require "spec_helper"

describe ApplicationHelper do
  let (:user) { create(:user) }
  describe "#name_with_status" do
    it "returns correct links" do
      expect(helper.name_with_status(user.full_name, user.status, user.id)).to eq("<a href=\"/users/1\" class=\"name\">Test Person</a><span class=\"status status-in\">in</span><a href=\"/users/1/status\" class=\"update-link\">Update</a>")
    end
  end
end