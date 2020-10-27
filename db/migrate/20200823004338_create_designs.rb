class CreateDesigns < ActiveRecord::Migration[6.0]
  def change
    create_table :designs do |t|
      t.string :name
      t.text :description
      t.string :design_type
      
      t.timestamps
    end
  end
end
