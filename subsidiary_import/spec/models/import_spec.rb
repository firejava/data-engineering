require "spec_helper"

describe Import do

  describe "#gross_revenue" do

    it "converts gross_revenue_in_cents to a decimal" do
      import = Import.new gross_revenue_in_cents: 525
      expect(import.gross_revenue).to eql(5.25)
    end

    it "returns nil if gross_revenue_in_cents is nil" do
      import = Import.new
      expect(import.gross_revenue).to be_nil
    end

  end

end
