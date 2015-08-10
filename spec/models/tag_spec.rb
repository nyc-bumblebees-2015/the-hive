require 'rails_helper'

describe Tag do
   it 'has a valid factory' do
    expect(build(:tag)).to be_valid
  end

  it 'is invalid without a first name' do
    tag = build(:tag, name: nil)
    tag.valid?
    expect(tag.errors[:name]).to include("can't be blank")
  end

end