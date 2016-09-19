require_relative 'hidden_words'
require_relative 'tablets_one'
require_relative 'concepts'


authors = ['The Báb', "'Abdu'l-Bahá", 'Shoghi Effendi', 'Universal House of Justice']
author_one = Author.create(name: "Bahá'u'lláh")

writings_arr_one = ['Kitáb-i-Aqdas', 'Gems of Divine Mysteris', 'The Kitáb-i-Íqán',]

hidden_words = Writing.new(title: 'The Hidden Words')
author_one.writings << hidden_words

writings_arr_one.each do |book|
  author_one.writings << Writing.new(title: book)
end

authors.each { |author| Author.create!(name: author) }

HIDDEN_WORDS_STRING_ARRAY.each do |string|
  hidden_words.quotes << Quote.create(text: string)
end

TABLETS_ARRAY.each do |writing_hash|
  Writing.create(title: writing_hash[:title], alt_title: writing_hash[:alt_title])
end

CONCEPTS.each do |concept|
  Concept.create(name: concept)
end
