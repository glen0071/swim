# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'

  # MySQL and PostgreSQL
  # ActiveRecord::Base.connection.execute("TRUNCATE #{table}")

  # SQLite
  ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
end

authors = ["Bahá'u'lláh", 'The Báb' "'Abdu'l-Bahá", 'Shoghi Effendi', 'Universal House of Justice']
books_one = ["Kitab-i-Aqdas"]
authors.each {|author| Author.create!(name: author)}
