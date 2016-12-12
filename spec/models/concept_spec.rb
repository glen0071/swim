require 'rails_helper'

RSpec.describe Concept, type: :model do

  it "is valid with name" do
    concept = described_class.new(name: 'Anything')
    expect(concept).to be_valid
  end

  it "is not valid with no name" do
    concept = described_class.new(name: nil)
    expect(concept).not_to be_valid
  end

end
