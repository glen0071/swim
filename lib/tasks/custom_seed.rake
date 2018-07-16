desc "One line task description"
namespace :seeding_db do
  task :seed_authors => [ :environment ] do
    load File.join('db', 'authors.rb')
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
