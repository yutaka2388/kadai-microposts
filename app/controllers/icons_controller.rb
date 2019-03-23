class IconsController < ApplicationController

  def show
    @icons = Icon.all
  end

  def create
    @icon = Icon.new(permit_params)
    @icon.save!
    redirect_to action: 'show'
  end

  private
    def permit_params
      params.require(:icon).permit(:image)
    end
end