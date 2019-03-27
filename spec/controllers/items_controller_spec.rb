require 'rails_helper'

describe ItemsController, type: :controller do
  let(:user) { create(:user) }
    describe 'GET #new' do
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

  describe 'DELETE #destroy' do
    let!(:item) { create(:item) }
    it "deletes the item" do
      expect do
        delete :destroy, params: { id: item.id }, session: {}
      end.to change(Item, :count).by(-1)
    end

    it 'redirects the :create template' do
      delete :destroy, params: { id: item.id }, session: {}
      expect(response).to redirect_to(item_path)
    end
  end



  # let(:user) { create(:user) }
  #   describe 'delete #destroy' do
  #     let(:user) { create(:user) }
  #     before do
  #       login_user user
  #     end

  #   context 'call from correct user' do

  #     it "deletes the article" do
  #       item = create(:item_with_images, vendor_id: user.id)
  #       expect{
  #         delete :destroy, id: item
  #       }.to change(Item,:count).by(-1)
  #     end

  #     it "redirects to root_path" do
  #       item = create(:item_with_images, saler_id: user.id)
  #       delete :destroy, id: item
  #       expect(response).to redirect_to(root_path)
  #     end
  #   end

  #   context 'call from incorrect user' do
  #     it "redirects to new_user_session_path" do
  #       different_user = create(:user)
  #       item = create(:item_with_images, saler_id: different_user.id)
  #       delete :destroy, id: item
  #       expect(response).to redirect_to(new_user_session_path)
  #     end
  #   end
  # end
end
