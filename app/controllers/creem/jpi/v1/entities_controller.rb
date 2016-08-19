class Creem::Jpi::V1::EntitiesController < ApplicationController

  before_filter :require_user_signed_in

  def index
    render json: {msg: 'hello world'}
  end

  def update

    if @entity.update!(@strong_params)
      render json: "#{@entity} updated succesfully"
    else
      render json: "#{@entity} couldn't be updated"
    end
  end
end
