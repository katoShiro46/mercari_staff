class Users::CardsController < ApplicationController
  include CardsActions
  before_action :authenticate_user!, only: [:show, :new, :create, :destroy]
  before_action :prepare_payjp, only: [:show, :new, :create, :destroy]
  before_action :header_menu,only: [:new,:show]
  add_breadcrumb 'メルカリ', :root_path
  add_breadcrumb 'マイページ', :users_path
  add_breadcrumb '支払い方法', :card_path, only: [:show, :new]
  add_breadcrumb 'クレジットカード情報入力', :new_card_path, only: [:new]

end
