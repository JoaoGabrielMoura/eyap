class AddProjectIdToProjectCriterium < ActiveRecord::Migration[5.1]
  def change
    add_column :project_criteria, :project_id, :integer
  end
end
