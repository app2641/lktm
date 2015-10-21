#! /usr/bin/env ruby
require 'RMagick'
require 'byebug'

module Lktm
  class LgtmMaker
    IMAGE_WIDTH = 1_000
    LIMIT_WIDTH = 270

    def initialize file_path, resize
      @file_path = file_path
      @resize = resize
    end

    def make
      imgs  = Magick::ImageList.new(@file_path)
      logo = logo_img imgs.first.columns

      imgs.each do |img|
        img.composite!(logo, Magick::CenterGravity, Magick::OverCompositeOp)
      end

      if LIMIT_WIDTH < imgs.first.columns && !@resize.nil?
        scale = LIMIT_WIDTH / imgs.first.columns.to_f
        imgs = imgs.coalesce
        imgs.each do |frame|
          frame.resize!(scale)
        end
      end

      imgs.optimize_layers(Magick::OptimizeLayer)
      imgs.write(@file_path)
    end

    private

    def logo_img width
      logo_path = File.dirname(__FILE__)+'/../../images/lgtm.gif'
      scale = width.to_f / IMAGE_WIDTH
      Magick::ImageList.new(logo_path).scale(scale)
    end
  end
end
