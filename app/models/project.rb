class Project < ApplicationRecord
    has_many :project_criterium
    accepts_nested_attributes_for :project_criterium    
    validates_presence_of :name, :description
end
