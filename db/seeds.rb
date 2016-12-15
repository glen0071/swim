require_relative 'hidden_words'
require_relative 'tablets_one'
require_relative 'authors_one'
require_relative 'concepts'

AUTHORS_ARRAY.each do |authors_hash|
  Author.create!(name: authors_hash[:name], start: authors_hash[:start], end: authors_hash[:end])
end

bab = Author.find_by(name: "The Báb")
baha = Author.find_by(name: "Bahá'u'lláh")

# CONCEPTS.each do |concept|
#   Concept.create!(name: concept)
# end

BAHA_TABLETS_ARRAY.each do |writing_hash|
  baha.writings << Writing.create!(title: writing_hash[:title], alt_title: writing_hash[:alt_title])
end

BAB_TABLETS_ARRAY.each do |writing_hash|
  bab.writings << Writing.create!(title: writing_hash[:title], alt_title: writing_hash[:alt_title])
end

# hidden_words = Writing.new(title: 'The Hidden Words')
# author_one.writings << hidden_words

# writings_arr_one.each do |book|
#   author_one.writings << Writing.new(title: book)
# end






# Writing.find_by(alt_title: 'The Hidden Words')
#
# HIDDEN_WORDS_STRING_ARRAY.each do |string|
#   new_quote = Quote.create!(text: string)
#   hidden_words.quotes << new_quote
#   baha.quotes << new_quote
# end
