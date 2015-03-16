require 'spec_helper'

describe UsersController do

  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET index" do
    before { get :index }
    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end

  describe 'GET show' do 
    before { get(:show, {'id' => user.id}) }
    it "renders the show page for the specific user" do 
      expect(response).to render_template("show")
    end
  end

  describe 'GET edit' do 
    before { get(:edit, {'id' => user.id}) }
    it "renders the edit page for the specific user" do 
      expect(response).to render_template("edit")
    end
  end

  describe 'PUT update' do 
    before { put(:update, {'id' => '3'}) }
    it "can't update someone else's status" do 
      expect(response).to raise_error
    end
  end


end
