DB = Sequel.connect('sqlite://database.db')
Sequel::Model.plugin :timestamps
