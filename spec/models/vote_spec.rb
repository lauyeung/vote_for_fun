require 'spec_helper'

describe Vote do
  it "has a note field" do
    note = 'awesome vote note'
    v = Vote.create(note: note)
    expect(v.note).to eql(note)
  end
end
