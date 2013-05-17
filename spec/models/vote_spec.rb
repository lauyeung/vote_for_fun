require 'spec_helper'

describe Vte do
  it "has a created at timestamp" do
    v = Vote.create
    expect(v.created_at).not_to be_nil
  end

  it "has a note field" do
    note = 'awesome vote note'
    v = Vote.create(note: note)
    expect(v.note).to eql(note)
  end
end
