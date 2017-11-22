class AddConfirmedToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :confirmed, :boolean
  end
end
