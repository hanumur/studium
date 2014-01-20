require "trade_client"

class TradingService
  def initialize(args)
    @client = args.fetch(:client) {
      Coinfloor::CFcon.new(
        ENV["COINFLOOR_IP"],
        ENV["COINFLOOR_ID"],
        ENV["COINFLOOR_PASS"],
        ENV["COINFLOOR_API_KEY"],
      )
    }
  end

  def call
    placeholder_order(100000000, 100)
    placeholder_order(100000000, 1000)

    if price_drops_amount
      get_orders.each |order| do
        cancel_order(order.fetch("id"))
      end
    end
  end

  private

  attr_reader :client

  def placeholder_order(quantity, price)
    client.exec(
      :placeorder,
      {
        :base_asset_id    => asset_btc,
        :counter_asset_id => asset_gbp,
        :quantity         => quantity,
        :price            => price,
      }
    )
  end

  def get_orders
    client.exec(:getorders, {})
  end

  def cancel_order(id)
    client.exec(:cancelorder, {:id => id})
  end

  def asset_btc
    63488
  end

  def asset_gbp
    64032
  end

  def price_drops_amount
    client.get_balance < amount
  end
end
