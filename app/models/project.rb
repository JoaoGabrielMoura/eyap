class Project < ApplicationRecord
    has_many :project_criterium
    accepts_nested_attributes_for :project_criterium    
    validates_presence_of :name, :description
    validate :has_criterium?
    
    def has_criterium?
      errors[:base] << "Debe tener minimo un criterio" if self.project_criterium.blank?
    end
end
