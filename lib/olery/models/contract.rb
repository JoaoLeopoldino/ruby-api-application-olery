# frozen_string_literal: true

module Olery
  class Contract < Sequel::Model
    one_to_many :user, key: :user_id
    one_to_many :hotel_groups, key: :group_id
  end
end
