class Hoge < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  has_many :hogehoges, dependent: :destroy
end
