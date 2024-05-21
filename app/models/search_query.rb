# app/models/search_query.rb
class SearchQuery < ApplicationRecord
  validates :query, presence: true
  validates :ip_address, presence: true
end
