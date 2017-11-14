class ChangeValueToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :project_criteria, :value, :float    
    change_column :project_criteria, :weight, :float        
  end
end
