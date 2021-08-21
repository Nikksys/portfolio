class AddRefDateToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :ref_date, :date
  end
end
