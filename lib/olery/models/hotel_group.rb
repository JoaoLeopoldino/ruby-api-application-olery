# frozen_string_literal: true

module Olery
  class HotelGroup < Sequel::Model
    many_to_one :hotel
    many_to_one :group
  end
end
