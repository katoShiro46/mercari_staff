class Items::Deals::CardsController < ApplicationController
  include CardsActions
  before_action :authenticate_user!, only: [:show, :new, :create, :destroy]
  before_action :prepare_payjp, only: [:show, :new, :create, :destroy]

end
