class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp' unless extension_enabled?('uuid-ossp')
    create_table :stocks, id: :uuid do |t|
      t.string :name, null: false
      t.integer :quantity, null: false, default: 0
    end
  end
end
