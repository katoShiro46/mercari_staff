class Users::Registrations::CardsController < ApplicationController
  include CardsActions
  before_action :prepare_payjp, only: [:new, :create]

  def create
    token = params[:token]
    @customer.cards.create(card: token) if @customer.cards.count == 0
    redirect_to users_registrations_done_path
  end

end
