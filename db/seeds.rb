require_relative 'hidden_words'
require_relative 'tablets_one'

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'

  # MySQL and PostgreSQL
  # ActiveRecord::Base.connection.execute("TRUNCATE #{table}")

  # SQLite
  ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
end

authors = ['The Báb' "'Abdu'l-Bahá", 'Shoghi Effendi', 'Universal House of Justice']
author_one = Author.create(name: "Bahá'u'lláh")

books_one = ['Kitáb-i-Aqdas', 'Epistle to the Son of the Wolf', 'Gems of Divine Mysteris', 'The Kitáb-i-Íqán', "Prayers and Meditations by Bahá'u'lláh", 'The Seven Valleys', 'The Four Valleys', 'The Summons of the Lord of Hosts', 'The Tabernacle of Unity']

hidden_words = Publication.new(name: 'The Hidden Words')
author_one.publications << hidden_words

books_one.each do |book|
  author_one.publications << Publication.new(name: book)
end

authors.each { |author| Author.create!(name: author) }

HIDDEN_WORDS_STRING_ARRAY.each do |string|
  hidden_words.quotes << Quote.create(text: string)
end

TABLETS_ARRAY.each do |writing_hash|
  Writing.create(title: writing_hash[:title], alt_title: writing_hash[:title])
end

concepts = ['Truth', 'Justice', 'Purity', 'Kindness', 'Radiance', 'Organic Growth']

concepts.each do |concept|
  Concept.create(name: concept)
end
