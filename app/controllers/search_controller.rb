class SearchController < ApplicationController

  def index
  end

  def results(repository = CompaniesHouseRepository.new)
    @results = repository.search_officers(params['search'])
  end
end
