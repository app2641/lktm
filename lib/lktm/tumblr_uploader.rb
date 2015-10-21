#! /usr/bin/env ruby
require 'yaml'
require 'tumblr_client'

module Lktm
  class TumblrUploader
    def initialize file_path
      @file_path = file_path
    end

    def upload
      yml = YAML.load_file(File.dirname(__FILE__)+'/../../config/application.yml')

      Tumblr.configure do |config|
        config.consumer_key = yml['tumblr']['consumer_key']
        config.consumer_secret = yml['tumblr']['secret_key']
        config.oauth_token = yml['tumblr']['oauth_token']
        config.oauth_token_secret = yml['tumblr']['oauth_token_secret']
      end

      client = Tumblr::Client.new
      client.photo("looks-kawaii-to-me.tumblr.com", {data: @file_path})
    end
  end
end
