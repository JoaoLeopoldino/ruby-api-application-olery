# frozen_string_literal: true

module Olery
  class GroupSubscription < Sequel::Model
    many_to_one :contract
    one_to_one :group
  end
end
