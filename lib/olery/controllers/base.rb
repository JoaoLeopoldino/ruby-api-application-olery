# frozen_string_literal: true

module Olery
  module Controller
    class Base < Sinatra::Base
      set :root, File.expand_path('../../..', __dir__)

      register Sinatra::Namespace
    end
  end
end
