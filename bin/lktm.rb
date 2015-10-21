#! /usr/bin/env ruby
require 'rubygems'

lib_path = File.dirname(__FILE__)+'/../lib'
$LOAD_PATH.unshift(lib_path) unless $LOAD_PATH.include?(lib_path)

require 'lktm'

begin
  Lktm::Main.new(ARGV).execute
rescue Interrupt # user pressed CTRL+C
  STDERR.puts "\nLKTM: exiting due to user request"
  exit 130
end

