class AddRefDateToDesigns < ActiveRecord::Migration[6.0]
  def change
    add_column :designs, :ref_date, :date
  end
end
