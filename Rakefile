require 'bundler'
Bundler.require

desc 'Run console'
task :console do
  sh 'irb -r ./config/application'
end

namespace :db do
  require_relative 'config/application'

  desc 'Create and setup a database'
  task :create do
    DB.create_table? :invoices do
      primary_key :id
      String :name
      String :state
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
