require 'bundler'
Bundler.setup
Bundler.require

require_relative 'database'

Dir.glob('./app/*.rb').each { |file| require file }
Dir.glob('./lib/*.rb').each { |file| require file }
