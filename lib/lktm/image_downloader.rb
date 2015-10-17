#! /usr/bin/env ruby
require 'open-uri'

module Lktm
  class ImageDownloader
    def initialize url
      @url = url
    end

    def download
      ext = File.extname(@url)
      file_path = "/tmp/lktm#{ext}"

      open(file_path, 'wb') do |output|
        open(@url) do |data|
          output.write(data.read)
        end
      end
      file_path
    end
  end
end
