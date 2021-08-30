class AddOnlineToDesigns < ActiveRecord::Migration[6.0]
  def change
    add_column :designs, :online, :boolean, default: false
  end
end
