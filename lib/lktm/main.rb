#! /usr/bin/env ruby
require 'lktm/image_downloader'
require 'lktm/lgtm_maker'
require 'lktm/tumblr_uploader'

module Lktm
  class Main
    def initialize args
      @url = args.first
      @resize = args[1]
    end

    def execute
      file_path = ImageDownloader.new(@url).download
      LgtmMaker.new(file_path, @resize).make
      TumblrUploader.new(file_path).upload
    end
  end
end
