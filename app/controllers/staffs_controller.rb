class StaffsController < ApplicationController
  before_action :header_menu,only: :index
  before_action :staff?
  def index
  end
end
