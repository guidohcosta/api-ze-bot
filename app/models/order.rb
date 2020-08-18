class Order < ApplicationRecord
  as_enum :status, %i[created paid sent delivered returned]

  validates :tracking, uniqueness: true
end
