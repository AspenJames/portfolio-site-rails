class Api::ProjectsController < ApplicationController
  def index
    render json: {yo: 'sup'}
  end
end
