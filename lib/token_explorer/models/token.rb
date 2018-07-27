module TokenExplorer
  module Models
    class Token
      attr_accessor :address, :name, :symbol, :total_supply, :decimals,
                    :owner, :transfer_count, :eth_transfer_count, :last_updated, :total_in,
                    :total_out, :issuances_count, :holders_count, :description,
                    :count_ops, :price, :price_change, :price_change_7d,
                    :price_change_30d, :price_timestamp, :market_cap_usd, :available_supply,
                    :volume_24h, :price_currency, :output
    end
  end
end
