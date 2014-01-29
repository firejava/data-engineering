class AddGrossRevenueToImports < ActiveRecord::Migration

  def change
    add_column :imports, :gross_revenue_in_cents, :integer
  end

end
