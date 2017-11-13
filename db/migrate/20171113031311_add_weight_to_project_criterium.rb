class AddWeightToProjectCriterium < ActiveRecord::Migration[5.1]
  def change
    add_column :project_criteria, :weight, :integer
  end
end
