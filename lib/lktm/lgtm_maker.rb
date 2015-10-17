#! /usr/bin/env ruby
require 'RMagick'
require 'byebug'

module Lktm
  class LgtmMaker
    IMAGE_WIDTH = 1_000

    def initialize file_path
      @file_path = file_path
    end

    def make
      imgs  = Magick::ImageList.new(@file_path)
      logo = logo_img imgs.first.columns

      imgs.each do |img|
        img.composite!(logo, Magick::CenterGravity, Magick::OverCompositeOp)
      end
      imgs.write(@file_path)
    end

    def logo_img width
      logo_path = File.dirname(__FILE__)+'/../../images/lgtm.gif'
      scale = width.to_f / IMAGE_WIDTH
      Magick::ImageList.new(logo_path).scale(scale)
    end
  end
end
