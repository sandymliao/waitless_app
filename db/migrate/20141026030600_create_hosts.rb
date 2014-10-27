class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :company
      t.integer :area_code
      t.timestamps
    end
  end
end
