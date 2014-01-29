require "spec_helper"

describe ImportLineItem do

  describe "#item_price" do

    it "converts item_price_in_cents to a decimal" do
      import = ImportLineItem.new item_price_in_cents: 395
      expect(import.item_price).to eql(3.95)
    end

    it "returns nil if item_price_in_cents is nil" do
      import = ImportLineItem.new
      expect(import.item_price).to be_nil
    end

  end

end
