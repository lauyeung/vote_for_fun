require 'spec_helper'

describe Activity do
 
 it "requires a description field" do
  activity = Activity.create(name: "big catch")
  expect(activity).to be_invalid
  activity.description = "fishing trip"
  expect(activity).to be_valid
 end

 it "requires a name field" do
  activity = Activity.create(description: "jetskis and segways")
  expect(activity).to be_invalid
  activity.name = "surf and turf"
  expect(activity).to be_valid
 end

 it "uses properly formatted error messages" do
  activity = Activity.create(description: "shorty")
  activity.valid?
  proper_message = "Please provide a description of atleast 10 characters, thanks!"
  expect(activity.errors.messages[:description]).to eql(proper_message)
 end

 it "returns the activity name in ALL CAPS" do
  name = "pizza party"
  activity = Activity.create({name: name, description: "fun times"})
  expect(activity.loud_name).to eql(name.upcase)
 end
end
