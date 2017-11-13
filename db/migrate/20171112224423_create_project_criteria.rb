class CreateProjectCriteria < ActiveRecord::Migration[5.1]
  def change
    create_table :project_criteria do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
