QUOTES = {
  text: 'words',
  author: 'name',
  writings: 'title',
  concepts: ['concept one', 'concept two']
}


desc "import quote data from csv"
namespace :quotes_csv do
  task :import_quotes do
    quotes_csv = File.read('./lib/tasks/quotes/date.csv')

  end
end

desc "export quote data to csv"
namespace :quotes_csv do
  task :export_quotes do

    quotes_csv = File.read('./lib/tasks/quotes/date.csv')
  end
end
