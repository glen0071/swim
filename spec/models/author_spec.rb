require 'rails_helper'

RSpec.describe Author, type: :model do
  
  let(:nameless_author) { Author.new }
  let(:named_author) { Author.new(name: "Author") }
  
  describe 'Author validations' do
    it 'returns an error if no name is given' do
      nameless_author.valid?
      expect(nameless_author.errors[:name]).to include("Author name cannot be blank")
    end
    
    it 'has a name' do 
      expect(named_author.name).to eq "Author"
    end
    
  end
  
  describe 'work association' do 
    context 'author with no works' do 
      it '#works returns empty array' do
        expect(named_author.works).to eq []
      end
    end
    
    context 'author with works' do 
      it '#works returns array of Works' do 
      end
    end
  end
  
  describe 'quote association' do 
    it 'must have an array of quotes through works' do
      
    end
  end
  
end
