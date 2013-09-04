require 'spec_helper'
require 'pry'

describe Vote do
  it "has a note field" do
    note = 'awesome vote note'
    v = Vote.create(note: note)
    binding.pry
    expect(v.note).to eql(note)
  end
end
