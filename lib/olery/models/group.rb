# frozen_string_literal: true

module Olery
  class Group < Sequel::Model
    one_to_many :hotel_groups, key: :group_id
    one_to_one :group_subcription
  end
end
