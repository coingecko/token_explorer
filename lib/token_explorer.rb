require "token_explorer/version"
require "http"
require "yaml"
require "token_explorer/models/token"

module TokenExplorer
  class Client

    def get_token(address)
      output = JSON.parse(HTTP.timeout(:write => 2, :connect => 5, :read => 8).get(api_url(address)))

      token                  = TokenExplorer::Models::Token.new
      token.address          = output['address']
      token.name             = output['name']
      token.symbol           = output['symbol']
      token.total_supply     = output['totalSupply'].to_f
      token.owner            = output['owner']
      token.transfer_count   = output['transfersCount']
      token.last_updated     = output['lastUpdated']
      token.total_in         = output['totalIn']
      token.total_out        = output['totalOut']
      token.issuances_count  = output['issuancesCount']
      token.holders_count    = output['holdersCount']
      token.description      = output['description']
      token.count_ops        = output['countOps']
      token.price            = output['rate'].to_f
      token.price_change     = output['price']['diff']
      token.price_change_7d  = output['price']['diff7d']
      token.price_change_30d = output['price']['diff30d']
      token.price_timestamp  = output['price']['ts'].to_i
      token.market_cap_usd   = output['price']['marketCapUsd'].to_f
      token.available_supply = output['price']['availableSupply'].to_f
      token.volume_24h       = output['price']['volume24h'].to_f
      token.price_currency   = output['price']['currency']
      token.output           = output
      token
    end
    
    def api_url(address)
      if not File.exist?("config/token_explorer_config.yml")
        config_file = {config: {api_key: "freekey"}}
        File.write("config/token_explorer_config.yml", config_file.to_yaml)
      end

      config = YAML.load_file('config/token_explorer_config.yml')
      api_key = config[:config][:api_key]
      "https://api.ethplorer.io/getTokenInfo/#{address}?apiKey=#{api_key}"  
    end
  end
end
