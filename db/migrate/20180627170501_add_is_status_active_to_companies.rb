class AddIsStatusActiveToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :is_status_active, :boolean, default: true
  end
end
