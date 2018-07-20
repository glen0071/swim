require_relative '../../db/authors'
require_relative '../../db/unity_quotes'

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

desc 'remove duplicate concept associations'
namespace :clean_db do
  task :remove_dup_quote_concepts => [ :environment ] do
    Quote.all.each do |q|
      q.concepts = q.concepts.uniq
      q.save
    end
  end
end