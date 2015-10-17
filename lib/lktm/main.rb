#! /usr/bin/env ruby
require 'lktm/image_downloader'
require 'lktm/lgtm_maker'

module Lktm
  class Main
    def initialize url
      @url = url
    end

    def execute
      file_path = ImageDownloader.new(@url).download
      LgtmMaker.new(file_path).make
    end
  end
end
