require_relative 'hidden_words'
require_relative 'writings_one'
require_relative 'authors_one'
require_relative 'concepts'

AUTHORS_ARRAY.each do |authors_hash|
  Author.find_or_create_by!(name: authors_hash[:name], start: authors_hash[:start], end: authors_hash[:end])
end

bab = Author.find_by(name: "The Báb")
baha = Author.find_by(name: "Bahá'u'lláh")

CONCEPTS.each do |concept|
  Concept.find_or_create_by!(name: concept)
end

BAHA_TABLETS_ARRAY.each do |writing_hash|
  baha.writings << Writing.create!(title: writing_hash[:title], alt_title: writing_hash[:alt_title])
end

BAB_TABLETS_ARRAY.each do |writing_hash|
  bab.writings << Writing.create!(title: writing_hash[:title], alt_title: writing_hash[:alt_title])
end

hidden_words = Writing.new(title: 'The Hidden Words')
baha.writings << hidden_words
# Writing.find_by(alt_title: 'The Hidden Words')

HIDDEN_WORDS_STRING_ARRAY.each do |hw_hash|
  new_quote = Quote.find_or_create_by!(text: hw_hash[:text])
  hidden_words.quotes << new_quote
  baha.quotes << new_quote
end

User.create!(email: 'mail@mail.com', password: 'password') unless user = User.find!(email: 'mail@mail.com')
