require_relative 'hidden_words'
require_relative 'writings_one'
require_relative 'authors_one'
require_relative 'concepts'

task :seed_authors => :environment do

end

bab = Author.find_by(name: "The Báb")
baha = Author.find_by(name: "Bahá'u'lláh")

CONCEPTS.each do |concept|
  Concept.find_or_create_by!(name: concept)
end

BAHA_TABLETS_ARRAY.each do |writing_hash|
  baha.writings << Writing.create!(
    title: writing_hash[:title],
    alt_title: writing_hash[:alt_title]
    date: writing_hash[:date]
    location: writing_hash[:location]
    notes: writing_hash[:notes]
  )
end

BAB_TABLETS_ARRAY.each do |writing_hash|
  bab.writings << Writing.create!(
    title: writing_hash[:title],
    alt_title: writing_hash[:alt_title]
    date: writing_hash[:date]
    location: writing_hash[:location]
    notes: writing_hash[:notes]
  )
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


dups = []

Reference.all.each do |r_one|
  Reference.all.each do |r_two|
    if r_one.id != r_two.id && r_one.concept_id == r_two.concept_id && r_one.quote_id == r_two.quote_id
      puts "here are some matches from #{r_one.id} and #{r_two.id}"
      puts "#{r_one.concept_id} concept to #{r_two.concept_id}"
      puts "#{r_one.quote_id} quote to #{r_two.quote_id}"
      r_two.destroy
    end
  end
end
