require 'json'
require 'base64'
require 'rest-client'


class CompaniesHouseRepository < Repository
  
  @@api_key =  ENV['CH_API_KEY']

  # Seach company officers
  def search_officers(query)
    url = sprintf('https://api.company-information.service.gov.uk/search/officers?q=%s', query)

    response = RestClient.get(
      url, 
      get_headers
    )
    if response.code == 200
      return JSON.parse(response.body)['items']
    else
      return null
    end
  end

  # Get the authorisation headers
  def get_headers
    { 
      'Authorization': sprintf('Basic %s', Base64.encode64(@@api_key + ":")) 
    }
  end
end