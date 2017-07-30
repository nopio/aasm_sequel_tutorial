require 'bundler'
Bundler.require

require_relative '../config/environment'
require_relative '../config/database'

Dir.glob('./app/*.rb').each { |file| require file }
