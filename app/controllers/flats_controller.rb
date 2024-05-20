require "open-uri"
require "pry-byebug"

class FlatsController < ApplicationController
  URL = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json".freeze
  before_action :set_flats

  def index
  end

  def show
    @flat = @flats.find { |flat| flat["id"] == params[:id].to_i }

    # TOMORROW
    # @flat = Flat.find(params[:id])
  end

  def set_flats
    flats = JSON.parse(URI.open(URL).read)
    @flats = []
    flats.each do |flat|
      @flats << flat
    end
  end
end
