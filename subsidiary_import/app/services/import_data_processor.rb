require "csv"

class ImportDataProcessor

  attr_reader :import

  def initialize import
    @import = import
  end

  # Processes the data file belonging to an import by extracting the line
  # items.
  #
  # If the import already has processed line items, they will be destroyed
  # and recreated.
  def call
    import.line_items.clear

    revenue_counter = 0

    CSV.foreach import.data.current_path, headers: true, col_sep: "\t" do |row|
      item_price_in_cents = extract_price_in_cents(row["item price"])
      purchase_count = row["purchase count"].to_i

      import.line_items.build \
        purchaser_name: row["purchaser name"],
        item_description: row["item description"],
        item_price_in_cents: item_price_in_cents,
        purchase_count: purchase_count,
        merchant_address: row["merchant address"],
        merchant_name: row["merchant name"]

      if purchase_count > 0 && item_price_in_cents > 0
        revenue_counter += purchase_count * item_price_in_cents
      end
    end
    import.gross_revenue_in_cents = revenue_counter
    import.save!
  end

  private
  
  def extract_price_in_cents value
    # Use BigDecimal to parse the string, convert to cents (USD),
    # then discard any partial cents.
    (BigDecimal.new(value) * 100).to_i
  end

end
