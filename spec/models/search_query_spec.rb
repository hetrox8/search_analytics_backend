# spec/models/search_query_spec.rb
require 'rails_helper'

RSpec.describe SearchQuery, type: :model do
  it 'has a valid factory' do
    expect(build(:search_query)).to be_valid
  end

  it 'is invalid without a query' do
    expect(build(:search_query, query: nil)).to be_invalid
  end

  it 'is invalid without an ip_address' do
    expect(build(:search_query, ip_address: nil)).to be_invalid
  end

  it 'is valid with valid attributes' do
    expect(build(:search_query, query: 'What is a good car', ip_address: '192.168.1.1')).to be_valid
  end
end
