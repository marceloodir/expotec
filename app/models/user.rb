class User < ApplicationRecord
  belongs_to :kind
  has_one :address, dependent: :destroy
  has_many :phones, dependent: :destroy, inverse_of: :user

  accepts_nested_attributes_for :address, update_only: true
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :cpf, presence: true
end