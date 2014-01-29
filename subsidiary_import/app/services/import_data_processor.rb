require "csv"

# Process the data file belonging to an import.
#
# Note: The import will be saved (with save!) and any exceptions raised
# are not intercepted.
class ImportDataProcessor

  attr_reader :import

  def initialize import
    @import = import
  end

  # Processes the data file belonging to an import by extracting the line
  # items,save the import, and return it.
  #
  # If the import already has processed line items, they will be destroyed
  # and recreated.
  def call
    import.line_items.clear

    revenue_counter = 0

    CSV.foreach import.data.current_path, headers: true, col_sep: "\t" do |row|
      purchaser_name = row["purchaser name"]
      item_description = row["item description"]
      item_price_in_cents = extract_price_in_cents(row["item price"])
      purchase_count = row["purchase count"].to_i
      merchant_address = row["merchant address"]
      merchant_name = row["merchant name"]

      # Find or create the merchant.
      # Note: A merchant is uniquely identified by the combination of it's
      # name and address.
      merchant = Merchant.find_or_create_by! name: merchant_name,
        address: merchant_address

      # Find or create the purchaser.
      purchaser = Purchaser.find_or_create_by! name: purchaser_name

      import.line_items.build \
        purchaser: purchaser,
        item_description: item_description,
        item_price_in_cents: item_price_in_cents,
        purchase_count: purchase_count,
        merchant: merchant

      if purchase_count > 0 && item_price_in_cents > 0
        revenue_counter += purchase_count * item_price_in_cents
      end
    end
    import.gross_revenue_in_cents = revenue_counter
    import.save!
    import
  end

  private
  
  def extract_price_in_cents value
    # Use BigDecimal to parse the string, convert to cents (USD),
    # then discard any partial cents.
    (BigDecimal.new(value) * 100).to_i
  end

end
