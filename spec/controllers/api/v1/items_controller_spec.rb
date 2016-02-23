require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "shows all items" do
      get :index, format: :json
      item1 = Item.create(:item)
      item2 = create(:item)
      items = Json.parse(response.body)

      expect(page).to have_content("name1")
      expect(page).to have_content("name2")
    end

  end
end
