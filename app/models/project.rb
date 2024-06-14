class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks,dependent: :destroy
  validate :title_must_be_valid


  private
    def title_must_be_valid
      errors.add(:base, "El nombre del proyecto es obligatorio") and return unless title.present?
    end
end
