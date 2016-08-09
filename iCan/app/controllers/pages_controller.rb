class PagesController < ApplicationController
  before_action :authorize!, only: [:index]
  def index
  	#debugger
  end
end
