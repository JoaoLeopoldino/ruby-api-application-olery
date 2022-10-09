# frozen_string_literal: true

module Olery
  module V1
    module Controller
      # controller/v1/users.rb
      class Users < ::Olery::Controller::Base
        namespace '/users' do
          error Sequel::NoMatchingRow do
            json_error 'The specified user does not exist', 404
          end

          before do
            content_type :json
          end

          get '' do
            json data: User.all.map { |u| serialize(u) }
          end

          get '/:id' do
            user = User.with_pk! params[:id]
            json data: serialize(user)
          end

          get '/:id/hotels' do
            hotels = Hotel.join(:hotel_groups)
                          .join(:groups, id: :group_id)
                          .join(:group_subscriptions)
                          .join(:contracts, id: :contract_id)
                          .join(:users)
                          .where(Sequel.lit('users.id = ?', params[:id]))
                          .select(Sequel.lit('hotels.id, hotels.name'))

            json data: serialize_hotels(hotels)
          end

          def serialize_hotels(hotels)
            hotels.map do |hotel|
              hotel.to_hash.slice(:id, :name)
            end
          end

          def serialize(user)
            user.to_hash.slice(:id, :name, :email)
          end
        end
      end
    end
  end
end
