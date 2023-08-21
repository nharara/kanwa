class Tag < ApplicationRecord
  belongs_to :emotion
  belongs_to :post
end
