require_relative 'hidden_words'
require_relative 'tablets_one'
require_relative 'authors_one'
require_relative 'concepts'

AUTHORS_ARRAY.each do |authors_hash|
  Author.create!(name: authors_hash[:name], start: authors_hash[:start], end: authors_hash[:end])
end
