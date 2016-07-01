require 'rails_helper'

RSpec.describe Quote, type: :model do
  let(:textless_quote) { Quote.new }
  let(:short_quote) { Quote.new(text: 'abcd') }

  describe 'Quote validations' do
    it 'returns an error if no text is given' do
      textless_quote.valid?
      expect(textless_quote.errors[:text]).to include('Quote cannot be less than 5 characters long')
    end

    it 'returns an error if no text is given' do
      short_quote.valid?
      expect(short_quote.errors[:text]).to include('Quote cannot be less than 5 characters long')
    end
  end
end
