require "spec_helper"

RSpec.describe TokenExplorer do
  it "has a version number" do
    expect(TokenExplorer::VERSION).not_to be nil
  end

  let(:client) { TokenExplorer::Client.new }
  let(:address) { "0x86fa049857e0209aa7d9e616f7eb3b3b78ecfdb0" }

  it 'get token information' do
    token = client.get_token(address)

    expect(token.address).to_not be nil
    expect(token.name).to_not be nil
    expect(token.symbol).to_not be nil
    expect(token.total_supply).to be_a Numeric
    expect(token.owner).to_not be nil
    expect(token.transfer_count).to be_a Numeric

    expect(token.last_updated).to be_a Numeric
    expect(2000..Date.today.year).to include(Time.at(token.last_updated).year)

    expect(token.total_in).to be_a Numeric
    expect(token.total_out).to be_a Numeric
    expect(token.issuances_count).to be_a Numeric
    expect(token.holders_count).to be_a Numeric
    expect(token.description).to_not be nil
    
    expect(token.price).to_not be nil
    expect(token.price_change).to be_a Numeric
    expect(token.price_change_7d).to be_a Numeric

    expect(token.price_timestamp).to be_a Numeric
    expect(2000..Date.today.year).to include(Time.at(token.price_timestamp).year)

    expect(token.market_cap_usd).to be_a Numeric
    expect(token.available_supply).to be_a Numeric
    expect(token.volume_24h).to be_a Numeric        
    expect(token.price_change_30d).to be_a Numeric
    expect(token.price_currency).to_not be nil
    expect(token.count_ops).to be_a Numeric

    expect(token.output).to_not be nil
  end  
end


  



 

