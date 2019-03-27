require 'active_support/concern'

module CardsActions
  extend ActiveSupport::Concern

  def show
  end

  def new
    redirect_to action: :show if @card
  end

  def create
    token = params[:token]
    @customer.cards.create(card: token) if @customer.cards.count == 0
    flash[:notice] = "カードが登録されました"
    redirect_to action: :show
  end

  def destroy
    @card.delete
    flash[:notice] = "カード情報が削除されました"
    redirect_to action: :show
  end

  private
  def prepare_payjp
    gon.payjp_pk_key =Rails.application.secrets.pay_pk_test
    Payjp.api_key =Rails.application.secrets.pay_sk_test
    unless current_user.payjp_id
      current_user.payjp_id = Payjp::Customer.create(description: 'test').id
      current_user.save
    end
    @customer = Payjp::Customer.retrieve(current_user.payjp_id)
    @card = @customer.cards.retrieve(@customer.default_card) if @customer.cards.count > 0
  end

end
