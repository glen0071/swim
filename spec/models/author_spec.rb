require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:nameless_author) { Author.new }
  let(:named_author) { Author.new(name: 'Author') }

  describe 'Author validations' do
    it 'returns an error if no name is given' do
      nameless_author.valid?
      expect(nameless_author.errors[:name]).to include('Author name cannot be blank')
    end

    it 'has a name' do
      expect(named_author.name).to eq 'Author'
    end
  end

  describe 'writing association' do
    context 'author with no writings' do
      it '#writings returns empty array' do
        pending('test new association since publications is invalid now')
        expect(named_author.publications).to eq []
      end
    end

    context 'author with writings' do
      it '#writings returns array of Writings' do
      end
    end
  end

  describe 'quote association' do
    it 'must have an array of quotes through writings' do
    end
  end
end
