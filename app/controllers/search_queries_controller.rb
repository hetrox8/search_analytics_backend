# app/controllers/search_queries_controller.rb
class SearchQueriesController < ApplicationController


  def create
    return unless params[:query].strip.match(/[\w\s]{3,}/)

    last_query = SearchQuery.where(ip_address: request.remote_ip).order(created_at: :desc).first

    if last_query && params[:query].start_with?(last_query.query)
      last_query.update(query: params[:query])
    else
      SearchQuery.create(query: params[:query], ip_address: request.remote_ip)
    end

    head :ok
  end

  def index
    @search_queries = SearchQuery.all
    render json: @search_queries
  end
end
