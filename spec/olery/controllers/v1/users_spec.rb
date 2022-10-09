require 'spec_helper'

describe Olery::V1::Controller::Users, type: :request do
  before do
    @users = create_list :user, 2
    @url   = '/users'
  end

  describe 'GET' do
    it 'lists the users' do
      response = get @url
      data     = JSON.parse response.body

      attrs    = @users.map do |u|
        {
          id: u.id,
          name: u.name,
          email: u.email
        }
      end
      expect(data['data'].count).to eq(2)
      expect(data['data'].map(&:deep_symbolize_keys)).to eq(attrs)
    end

    it 'lists the users' do
      response = get "#{@url}/#{@users[0].id}"
      data     = JSON.parse response.body

      attrs = {
        id: @users[0].id,
        name: @users[0].name,
        email: @users[0].email
      }
      expect(data['data'].deep_symbolize_keys).to eq(attrs)
    end
  end
end
