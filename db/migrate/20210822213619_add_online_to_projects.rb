class AddOnlineToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :online, :boolean, default: false
  end
end
