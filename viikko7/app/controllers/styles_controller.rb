class StylesController < ApplicationController
  before_action :ensure_that_admin, only: [:destroy]

  def index
    @styles = Style.all
  end
end