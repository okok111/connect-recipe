class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :hoges, dependent: :destroy
end
