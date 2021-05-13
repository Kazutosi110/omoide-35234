class Purchase < ApplicationRecord
  belongs_to :record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :people
end
