require 'rails_helper'

RSpec.describe Work, type: :model do

    let(:nameless_work) { Work.new }
    let(:named_work) { Work.new(name: 'Work') }
  
  describe 'Work validations' do
    
    it 'returns an error if no name is given' do
      nameless_work.valid?
      expect(nameless_work.errors[:name]).to include("Name cannot be blank")
    end
    
    it 'has a name' do 
      expect(named_work.name).to eq 'Work'
    end
    
  end
  
  describe 'Work associations' do
      
    it 'can be assigned to an Author' do 
    
      author = Author.new(name: 'Author')
      book = Work.new(name: 'Book')
      author.works << book
      expect(author.works[0].name).to eq 'Book'
        
    end
  end
  
end
