if ENV['RACK_ENV'] == 'test'
  Dotenv.load('.env.test')
else
  Dotenv.load
end
