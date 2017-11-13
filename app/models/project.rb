class Project < ApplicationRecord
    has_many :project_criterium
    validates_presence_of :name, :description
    accepts_nested_attributes_for :project_criterium
end
