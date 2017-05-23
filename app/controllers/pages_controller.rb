class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def styleguide
    @base_font = "Source Sans Pro"
    @header_font = "Roboto"
  end
end
