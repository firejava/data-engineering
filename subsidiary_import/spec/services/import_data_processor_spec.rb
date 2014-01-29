require "spec_helper"

describe ImportDataProcessor do

  let(:import) { Import.create! data: data_file }

  let(:processor) { ImportDataProcessor.new import }

  before :each do
    processor.call
    import.reload
  end

  context "with an empty data file" do

    let(:data_file) { fixture_file "empty.tab" }

    it "results in 0 line items for the import" do
      expect(import.line_items).to be_empty
    end

  end

  context "with the single record fixture" do

    let(:data_file) { fixture_file "single.tab" }

    it "generates one line item" do
      expect(import.line_items.count).to eql(1)
    end

    describe "the line item" do

      subject(:line_item) { import.line_items.first }

      it "extracts the correct purchaser name" do
        expect(line_item.purchaser_name).to eql("Snake Plissken")
      end

      it "extracts the correct item description" do
        expect(line_item.item_description).to eql("$10 off $20 of food")
      end

      it "extracts the correct item price (in cents)" do
        expect(line_item.item_price_in_cents).to eql(1000)
      end

      it "extracts the correct purchase count" do
        expect(line_item.purchase_count).to eql(2)
      end

      it "extracts the correct merchant address" do
        expect(line_item.merchant_address).to eql("987 Fake St")
      end

      it "extracts the correct merchant name" do
        expect(line_item.merchant_name).to eql("Bob's Pizza")
      end

    end

  end

end
