class ProjectCriterium < ApplicationRecord
    belongs_to :project
    validates_presence_of :name, :value, :weight
end
