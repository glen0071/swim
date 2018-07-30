require_relative '../../db/authors'
require_relative '../../db/unity_quotes'
require_relative '../../db/writings_one'

desc "Load authors into db"
namespace :populate_db do
  task :seed_authors => [ :environment ] do
    AUTHORS_ARRAY.each do |authors_hash|
      author = Author.find_or_create_by!(name: authors_hash[:name])
      puts "updating #{author.name}"
      author.update_attributes(
        start: authors_hash[:start],
        end: authors_hash[:end],
        birth: authors_hash[:birth],
        death: authors_hash[:death]
      )
    end
  end
end

desc "Load writings into db"
namespace :populate_db do
  task :seed_writings => [ :environment ] do
    BAB_TABLETS_ARRAY.each do |writing_hash|
      author = Author.find_or_create_by!(name: 'The Báb')
      puts "updating #{author.name}, #{writing_hash[:title]}"
      writing = Writing.find_or_create_by!(title: writing_hash[:title])
      writing.update_attributes(
        alt_title: writing_hash[:title],
        alt_title: writing_hash[:alt_title],
        date: writing_hash[:date],
        location: writing_hash[:location],
        notes: writing_hash[:notes],
      )
    end
  end
end

desc "Load unity quotes into db"
namespace :populate_db do
  task :seed_unity_quotes => [ :environment ] do
    unity = Concept.find_or_create_by(name: 'unity')
    UNITY_QUOTES.each_with_index do |quote_object, i|
      quote = Quote.find_or_create_by!(text: quote_object[:text])
      puts quote_object[:text][0...30] + '...'
      puts "saving #{i} of #{UNITY_QUOTES.length}"
      author = ''
      Author.all.each_with_index do |auth|
        if quote_object[:author] == auth.name
          author = auth
        end
      end
      quote.update_attributes(
        author: author
      )
      if quote_object[:writing]
        w = Writing.find_or_create_by!(title: quote_object[:writing])
        quote.update_attributes(writing: w)
      end
      if quote_object[:attribution]
        quote.update_attributes(attribution: quote_object[:attribution])
      end
      if quote_object[:other_concepts]
        quote_object[:other_concepts].each do |concept_string|
          concept = Concept.find_or_create_by!(name: concept_string)
          concept.add_quote(quote)
        end
      end
      unity.add_quote(quote)
    end
  end
end
