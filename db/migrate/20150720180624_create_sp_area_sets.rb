class CreateSpAreaSets < ActiveRecord::Migration
  def change
    create_table :sp_area_sets do |t|
    	t.integer :service_provider_id
    	t.integer :area_id
    	t.boolean :primary
    	
      t.timestamps null: false
    end
  end
end
