require_relative 'hidden_words'
require_relative 'tablets_one'
require_relative 'authors_one'
require_relative 'concepts'

hidden_words = Writing.new(title: 'The Hidden Words')
# author_one.writings << hidden_words

# writings_arr_one.each do |book|
#   author_one.writings << Writing.new(title: book)
# end

AUTHORS_ARRAY.each do |authors_hash|
  Author.create!(name: authors_hash[:name], start: authors_hash[:start], end: authors_hash[:end])
end

baha = Author.find_by(name: "Bahá'u'lláh")

TABLETS_ARRAY.each do |writing_hash|
  baha.writings << Writing.create!(title: writing_hash[:title], alt_title: writing_hash[:alt_title])
end

Writing.find_by(alt_title: 'The Hidden Words')

HIDDEN_WORDS_STRING_ARRAY.each do |string|
  new_quote = Quote.create!(text: string)
  hidden_words.quotes << new_quote
  baha.quotes << new_quote
end

CONCEPTS.each do |concept|
  Concept.create!(name: concept)
end
