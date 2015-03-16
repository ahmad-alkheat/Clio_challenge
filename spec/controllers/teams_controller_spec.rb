require 'spec_helper'

describe TeamsController do

  let(:team) { create(:team) }
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
    before { get(:show, {'id' => team.id}) }
    it "renders the show page for the specific team" do 
      expect(response).to render_template("show")
    end
  end

  describe 'GET edit' do 
    before { get(:edit, {'id' => team.id}) }
    it "renders the edit page for the specific team" do 
      expect(response).to render_template("edit")
    end
  end

  describe 'GET new' do 
    before { get(:new, {'id' => team.id}) }
    it "renders the edit page for the specific team" do 
      expect(response).to render_template("new")
    end
  end


end

