# frozen_string_literal: true

module Olery
  class User < Sequel::Model
    many_to_one :contracts, key: :contract_id
  end
end
