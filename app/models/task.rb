class Task < ApplicationRecord
  belongs_to :project
  validate :title_must_be_valid

  private
    def title_must_be_valid
      errors.add(:base, "El nombre de la tarea es obligatorio") and return unless title.present?
    end
end
